class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.integer :percentage
      t.datetime :expire_at
      t.integer :usage_number

      t.timestamps
    end
  end
end
