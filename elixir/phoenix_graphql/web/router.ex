defmodule PhoenixGraphql.Router do
  use PhoenixGraphql.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixGraphql do
    pipe_through :api
  end
end
