Sequel.migration do
  up do
    create_table(:posts) do
      primary_key :id
      String :title, :null=>false
      String :body, :null=>false
      foreign_key :user_id, :users
    end
  end

  down do
    drop_table(:posts)
  end
end
