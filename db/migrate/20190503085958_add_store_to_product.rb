class AddStoreToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :Store, foreign_key: true
  end
end
