# If you need extra protection.
# require 'rack/protection'
# Cuba.use Rack::Protection
# Cuba.use Rack::Protection::RemoteReferrer

# To launch just type: 'rackup' in your console
Cuba.define do
  on get do

    on root do
      res.write view("graphiql")
    end

  end

  on post do
    on "graphql" do
        params =  JSON.parse(req.body.read)
        result = Schema.execute(
          params["query"],
          variables: params["variables"]
        )

        res.headers["Content-Type"] = "application/json; charset=utf-8"
        res.write result.to_json
    end
  end
end
