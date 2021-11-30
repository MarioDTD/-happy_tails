class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animal
      t.string :breed
      t.string :color
      t.integer :fee
      t.integer :age
      t.string :sterilised
      t.string :image_url
      t.boolean :adopted, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
