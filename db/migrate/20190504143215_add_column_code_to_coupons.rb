class AddColumnCodeToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :code, :string
  end
end
