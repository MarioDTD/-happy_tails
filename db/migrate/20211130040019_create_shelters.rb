class CreateShelters < ActiveRecord::Migration[6.1]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
