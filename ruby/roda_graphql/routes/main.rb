class RodaGraphql
  route do |r|
    r.root do
      view("welcome")
    end

    r.on "graphql" do
      r.get do
        result = Schema.execute(
          r["query"],
          variables: r["variables"]
        )

        response['Content-Type'] = 'application/json; charset=utf-8'
        result.to_json
      end
    end

    r.assets
    r.multi_route
  end
end
