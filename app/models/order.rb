class Order < ApplicationRecord
    belongs_to :user
    belongs_to :state
    belongs_to :coupon
    has_and_belongs_to_many :products
end