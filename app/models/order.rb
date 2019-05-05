class Order < ApplicationRecord
    belongs_to :user
    belongs_to :state
    belongs_to :coupon
    has_and_belongs_to_many :products

    def self.get_carts_of_current_user
        Cart.get_carts_of_current_user
    end

    def self.get_user_orders
        where(:user_id => 1)
    end
end
