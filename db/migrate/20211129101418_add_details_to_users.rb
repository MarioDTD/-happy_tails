class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :role, :string
    add_column :users, :contact, :string
  end
end
