defmodule PhoenixGraphql.Router do
  use PhoenixGraphql.Web, :router
  import Joken

  @skip_token_verification %{joken_skip: true}

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :graphql do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug Joken.Plug, verify: &PhoenixGraphql.Router.verify_function/0
    plug PhoenixGraphql.Context
  end

  # Skip root route
  scope "/", PhoenixGraphql do
    pipe_through :browser
    get "/", PageController, :graphiql, private: @skip_token_verification
  end

  scope "/graphql" do
    pipe_through :graphql
    get "/", Absinthe.Plug, schema: PhoenixGraphql.Api.Schema
    post "/", Absinthe.Plug, schema: PhoenixGraphql.Api.Schema
  end

  def verify_function() do
    %Joken.Token{}
    |> with_json_module(Poison)
    |> with_signer(hs256("secret"))
    |> with_sub(1234567890)
  end
end
