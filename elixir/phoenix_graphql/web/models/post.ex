defmodule PhoenixGraphql.Post do
  use PhoenixGraphql.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, PhoenixGraphql.User

    has_many :comments, PhoenixGraphql.Comment
    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
  end

  def with_comments(query) do
    from p in query,
    join: c in assoc(p, :comments),
    join: u in PhoenixGraphql.User, on: c.user_id == u.id,
    order_by: [desc: c.id],
    preload: [:user, comments: {c, user: u}]
  end
end
