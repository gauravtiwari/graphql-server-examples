class Users < ROM::Relation[:sql]
  dataset :users
  register_as :users

  def with_posts
    left_join(:posts, user_id: :id)
  end
  def with_comments
    left_join(:comments, user_id: :id)
  end
end
