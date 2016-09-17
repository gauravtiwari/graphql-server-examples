PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A post"

  interfaces [NodeIdentification.interface]
  global_id_field :id

  field :title, !types.String
  field :body, !types.String
  field :user, -> { UserType }
  field :comments do
    type types[!CommentType]
    resolve -> (obj, args, ctx) { obj.comments.includes(:user) }
  end
end
