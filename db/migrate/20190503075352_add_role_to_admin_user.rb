class AddRoleToAdminUser < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :role, :string ,null: false , default: 'seller'
  end
end
