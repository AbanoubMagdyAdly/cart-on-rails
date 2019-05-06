class AddQuantityToOrdersProductsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :orders_products, :quantity, :integer, :null => false, :default => 1
  end
end
