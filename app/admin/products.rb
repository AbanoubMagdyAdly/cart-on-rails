ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :category_id,:store_id, :brand_id, :description,:price, :in_stock, product_images:[]
form html: { multipart: true } do |f|
    f.inputs do
      f.input :category
      f.input :brand
      f.input :store
      f.input :title
      f.input :description
      f.input :price
      f.input :in_stock
      f.input :product_images, as: :file, input_html: { multiple: true }
    end
    actions
  end

# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
