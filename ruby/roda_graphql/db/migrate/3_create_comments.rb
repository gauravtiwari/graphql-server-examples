ROM::SQL.migration do
  change do
    create_table :comments do
      primary_key :id
      column :body, String, null: false
      foreign_key :user_id, :users, index: true, null: false
      foreign_key :post_id, :posts, index: true, null: false
    end
  end
end
