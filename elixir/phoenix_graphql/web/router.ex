defmodule PhoenixGraphql.Router do
  use PhoenixGraphql.Web, :router

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
    plug PhoenixGraphql.Context
  end

  scope "/", PhoenixGraphql do
    pipe_through :browser
    get "/", PageController, :graphiql
  end

  scope "/graphql" do
    pipe_through :graphql
    get "/", Absinthe.Plug, schema: PhoenixGraphql.Api.Schema
    post "/", Absinthe.Plug, schema: PhoenixGraphql.Api.Schema
  end
end
