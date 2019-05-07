class Coupon < ApplicationRecord
  has_many :users
  validates :amount, presence: true ,:numericality => { greater_than_or_equal_to: 1 ,only_integer: true }
  validates :code, presence: true ,uniqueness: true
  validates :limit, presence: true
  validates :expire_at , presence: true
  
  def self.is_valid?(code , user_id)
      coupon=Coupon.find_by(code: code)
        if coupon && !UserCoupon.already_used?(user_id,code)
          (coupon.expire_at.nil? || coupon.expire_at >= Date.current) &&
          (coupon.limit == 0 || coupon.limit > coupon.used)
          return true
        end
      return false
  end
  def self.discounted_price(price,code,user_id)
      coupon=Coupon.find_by(code: code)
      UserCoupon.new(coupon_id: coupon.id, user_id: user_id)
      new_price = if is_valid?(code ,user_id)
                    coupon.used++
                    if coupon.percentage
                      price - (price * (coupon.amount/100))
                    else
                      (price - coupon.amount)
                    end
                  else
                    price
                  end
    UserCoupon.save
  return new_price
  end



  def display_name
    code   
  end
end
