class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total_paid
      t.belongs_to :user, foreign_key: true
      t.belongs_to :coupon, foreign_key: true
      t.belongs_to :state, foreign_key: true
    end
  end
end
