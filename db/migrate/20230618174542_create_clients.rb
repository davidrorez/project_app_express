class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :physical_address
      t.string :password
      t.integer :state

      t.timestamps
    end
  end
end
