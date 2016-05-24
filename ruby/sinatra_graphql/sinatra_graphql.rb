class SinatraGraphql < Sinatra::Base
  set :public_folder => "public", :static => true

  get "/" do
    erb :welcome
  end

  get "/graphiql" do
    erb :graphiql
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
