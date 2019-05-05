class OrderSerializer < ActiveModel::Serializer
  attributes :id , :total_paid , :state_id
end
