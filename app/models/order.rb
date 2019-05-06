class Order < ApplicationRecord
    belongs_to :user
    belongs_to :state
    belongs_to :coupon
    has_and_belongs_to_many :products

    def self.get_carts_of_current_user(user)
        Cart.get_carts_of_current_user(user)
    end

    def self.get_user_orders(user)
        where(:user_id => user.id)
    end

    def self.get_coupon(code)
        coupon=Coupon.find_by(code: code)
    end
end
