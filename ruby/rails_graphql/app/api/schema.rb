QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :post do
    type PostType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Post.find(args["id"]) }
  end

  field :all_posts do
    type types[!PostType]
    resolve -> (obj, args, ctx) { Post.all.includes(:user, :comments) }
  end
end

Schema = GraphQL::Schema.new(query: QueryType)
