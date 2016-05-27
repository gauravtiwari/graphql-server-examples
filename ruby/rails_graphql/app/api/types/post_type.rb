PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A post"

  field :id, !types.ID
  field :title, !types.String
  field :body, !types.String
  field :user, -> { UserType }
  field :comments do
    type types[!CommentType]
    resolve -> (obj, args, ctx) { obj.comments.includes(:user) }
  end
end
