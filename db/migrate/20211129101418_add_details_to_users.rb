class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :admin, :boolean
    add_column :users, :contact, :string
  end
end
