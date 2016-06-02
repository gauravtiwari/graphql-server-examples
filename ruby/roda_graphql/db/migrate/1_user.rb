Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :first_name, :null=>false
      String :last_name, :null=>false
      String :email, :null=>false
      String :username, :null=>false
    end
  end

  down do
    drop_table(:users)
  end
end
