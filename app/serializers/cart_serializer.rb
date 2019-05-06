class CartSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :user_id, :quantity, :product
end
