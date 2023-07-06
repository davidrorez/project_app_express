class AddBodyToDish < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :description, :text
  end
end
