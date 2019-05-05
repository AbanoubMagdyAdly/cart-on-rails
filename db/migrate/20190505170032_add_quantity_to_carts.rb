class AddQuantityToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :quantity, :integer, :null => false, :default => 1
  end
end
