class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :in_stock
      t.belongs_to :category, foreign_key: true
      t.belongs_to :brand, foreign_key: true

      t.timestamps
    end
  end
end
