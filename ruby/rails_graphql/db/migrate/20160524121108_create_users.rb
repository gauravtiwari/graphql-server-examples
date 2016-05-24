class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :username
  end
end
