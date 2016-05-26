defmodule PhoenixGraphql.Comment do
  use PhoenixGraphql.Web, :model

  schema "comments" do
    field :body, :string
    belongs_to :user, PhoenixGraphql.User
    belongs_to :post_ud, PhoenixGraphql.PostUd

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body])
    |> validate_required([:body])
  end
end
