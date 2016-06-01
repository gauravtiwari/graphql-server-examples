class Posts < ROM::Relation[:sql]
  dataset :posts
  register_as :posts

  def with_comments
    left_join(:comments, post_id: :id)
  end
end
