require 'rack/protection'
Cuba.use Rack::Session::Cookie, secret: 'super_secret_key'
Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer
# Use middleware for demo (use authentication in real app)
Cuba.use PassAuthToken
# Verify token
Cuba.use Rack::JWT::Auth, {secret: 'super_secret_key', options: { algorithm: 'HS256' }}

Cuba.define do
  # Pass token to the view
  data = {user_id: 1}
  token = Rack::JWT::Token.encode(data, 'super_secret_key', 'HS256')

  on get do
    on root do
      res.write view("graphiql", token: token)
    end
  end

  on post do
    on "graphql" do
      params =  JSON.parse(req.body.read)
      payload = Schema.execute(
        params["query"],
        variables: params["variables"]
      ).to_json

      res.headers["Content-Type"] = "application/json; charset=utf-8"
      res.write payload
    end
  end
end
