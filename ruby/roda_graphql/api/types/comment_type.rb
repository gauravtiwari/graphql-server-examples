CommentType = GraphQL::ObjectType.define do
  name "Comment"
  description "A comment"

  field :id, !types.ID
  field :body, !types.String
  field :user, -> { UserType }
  field :post, -> { PostType }
end
