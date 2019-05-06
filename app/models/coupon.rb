class Coupon < ApplicationRecord
  validates :amount, presence: true ,:numericality => { greater_than_or_equal_to: 1 ,only_integer: true }
  validates :code, presence: true ,uniqueness: true
  validates :limit, presence: true
  validates :expire_at , presence: true
  
  def is_valid?(code)
      coupon=Coupon.find_by(code: code)
        (coupon.expire_at.nil? || coupon.expire_at >= Date.current) &&
        (coupon.limit == 0 || coupon.limit > coupon.used)
  end
  def discounted_price(price,code)
      coupon=Coupon.find_by(code: code)
      new_price = if is_valid?(code)
                    if coupon.percentage
                      price.to_f - (price.to_f * (coupon.amount.to_f/100))
                    else
                      (price.to_f - coupon.amount.to_f)
                    end
                  else
                    price
                  end
  return new_price.floor
  end



  def display_name
    code   
  end
end
