class CreateComment < ROM::Commands::Create[:sql]
  relation :comments
  register_as :create
  result :one

  associates :user, key: [:user_id, :id]
  associates :post, key: [:post_id, :id]
end
