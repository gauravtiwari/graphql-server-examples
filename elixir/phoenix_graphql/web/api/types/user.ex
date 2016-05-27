defmodule PhoenixGraphql.Api.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc """
  A user
  """
  object :user do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :username, :string
    field :posts, list_of(:post)
  end
end
