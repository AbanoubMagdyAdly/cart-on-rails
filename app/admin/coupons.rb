ActiveAdmin.register Coupon do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :code, :percentage, :expire_at  ,:amount ,:limit
form do |f|
    f.inputs do
      f.input :code
      f.input :expire_at
      f.input :limit
      f.input :amount
      f.input :percentage
    end
    actions
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
