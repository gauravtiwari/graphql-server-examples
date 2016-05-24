Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/", graphql_path: "/graphql"
  scope '/graphql' do
    post "/", to: "graphql#create"
  end
end
