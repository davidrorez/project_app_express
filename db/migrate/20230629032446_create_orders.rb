class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :state
      t.belongs_to :client

      t.timestamps
    end
  end
end
