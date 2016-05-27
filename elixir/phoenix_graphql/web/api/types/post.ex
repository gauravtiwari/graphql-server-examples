defmodule PhoenixGraphql.Api.Schema.Types.Post do
  use Absinthe.Schema.Notation

  @desc """
  A post
  """
  object :post do
  	field :id, :id
    field :title, :string
    field :body,
      type: :string,
      resolve: fn
       _, obj ->
        {:ok, obj.source.body |> Earmark.to_html}
      end
    field :user, :user
    field :comments, list_of(:comment)
  end
end
