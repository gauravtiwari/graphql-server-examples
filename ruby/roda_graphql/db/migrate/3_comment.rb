Sequel.migration do
  up do
    create_table(:comments) do
      primary_key :id
      String :body, :null=>false
      foreign_key :user_id, :users
      foreign_key :post_id, :posts
    end
  end

  down do
    drop_table(:comments)
  end
end
