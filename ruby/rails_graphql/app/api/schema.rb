QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"
  field :node, field: NodeIdentification.field

  field :post do
    type PostType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Post.includes(:user, :comments).find(args["id"]) }
  end

  field :all_posts do
    type types[!PostType]
    resolve -> (obj, args, ctx) { Post.all.includes(:user, :comments) }
  end
end

Schema = GraphQL::Schema.define do
  query QueryType
  rescue_from(ActiveRecord::RecordInvalid) do |_error|
    'Some data could not be saved'
  end

  rescue_from(ActiveRecord::RecordNotFound) do |_error|
    'Could not find the record'
  end

  resolve_type -> (object, _ctx) { Schema.types[type_name(object)] }
  node_identification NodeIdentification
end

def type_name(object)
  object.class.name
end
