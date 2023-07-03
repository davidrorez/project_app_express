class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.binary :photo
      t.integer :state
      
      t.timestamps
    end
  end
end