class Cart < ApplicationRecord
    belongs_to :user
    belongs_to :product

    def self.get_carts_of_current_user(user)
        Cart.where(:user_id  => user.id)
    end
end
