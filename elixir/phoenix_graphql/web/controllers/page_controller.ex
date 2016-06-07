defmodule PhoenixGraphql.PageController do
  use PhoenixGraphql.Web, :controller
  import Joken

  def graphiql(conn, _params) do
    # Pass to root route as we don't know the token
    # For real API you would use authentication or something
    auth_token =  token()
      |> with_sub(1234567890)
      |> sign(hs256("secret"))
      |> get_compact

    render(conn, "graphiql.html", token: auth_token)
  end
end
