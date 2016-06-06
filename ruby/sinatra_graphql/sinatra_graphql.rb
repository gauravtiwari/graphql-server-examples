require 'rack/protection'
class SinatraGraphql < Sinatra::Base
  set :public_folder => "public", :static => true
  use Rack::Session::Cookie, secret: 'super_secret_key'
  use Rack::Protection
  use Rack::Protection::RemoteReferrer
  use PassAuthToken
  use Rack::JWT::Auth, {secret: 'super_secret_key', exclude: %w(/javascripts /stylesheets), options: { algorithm: 'HS256' }}

  get "/" do
    # Pass token to the view
    data = {user_id: 1}
    token = Rack::JWT::Token.encode(data, 'super_secret_key', 'HS256')
    erb :graphiql, locals: {token: token}
  end

  post "/graphql" do
    params =  JSON.parse(request.body.read)
    result = Schema.execute(
      params["query"],
      variables: params["variables"]
    )
    content_type :json
    result.to_json
  end
end
