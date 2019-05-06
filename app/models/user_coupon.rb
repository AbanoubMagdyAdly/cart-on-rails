class UserCoupon < ApplicationRecord
    belongs_to :user
    belongs_to :coupon
    def self.already_used?(user_id,code)
        coupon=Coupon.find_by(code: code)
        UserCoupon.find_by(user_id,coupon.id)
    end
end
