defmodule PhoenixGraphql.PageController do
  use PhoenixGraphql.Web, :controller

  def graphiql(conn, _params) do
    render(conn, "graphiql.html")
  end
end
