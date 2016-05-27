defmodule PhoenixGraphql.Api.Schema.Types.Comment do
  use Absinthe.Schema.Notation

  @desc """
  A comment
  """
  object :comment do
    field :id, :id
    field :body,
      type: :string,
      resolve: fn
       _, obj ->
        {:ok, obj.source.body |> Earmark.to_html}
      end
    field :inserted_at, :string
    field :user, :user
  end
end
