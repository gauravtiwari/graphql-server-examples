ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :first_name, String, null: false
      column :last_name, String, null: false
      column :username, String, null: false
      column :email, String, null: false
    end
  end
end
