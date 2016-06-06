# If you need extra protection.
require 'rack/protection'
Cuba.use Rack::Session::Cookie, secret: 'hello'
Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer
Cuba.use Rack::JWT::Auth, {secret: nil, verify: false, options: { algorithm: 'none' }}

# To launch just type: 'rackup' in your console
Cuba.define do
  data = {user_id: 1}
  status, headers, body = @app.call env

  token = Rack::JWT::Token.encode(data, nil, 'none')

  on get, { 'AUTHORIZATION' => "Bearer #{Rack::JWT::Token.encode(data, nil, 'none')}" } do
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
