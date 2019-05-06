class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.integer :amount ,default: 0
      t.datetime :expire_at
      t.integer :limit ,default: 0
      t.integer :used ,default: 0, null: false
      t.boolean :percentage ,default: false
      t.timestamps
    end
  end
end
