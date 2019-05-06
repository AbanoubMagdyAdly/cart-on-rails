class Coupon < ApplicationRecord
  validates :amount, presence: true ,:numericality => { greater_than_or_equal_to: 1 ,only_integer: true }
  validates :code, presence: true ,uniqueness: true
  validates :limit, presence: true
  validates :expire_at , presence: true
  
  def is_valid?(code)
      coupon=Coupon.find_by(code: code)
        (coupon.expiration.nil? || coupon.expiration >= Date.current) &&
        (coupon.limit == 0 || coupon.limit > coupon.used)
  end
  def discounted_price(price)
      new_price = if is_valid?
                    if percentage
                      price.to_f - (price.to_f * (amount.to_f/100))
                    else
                      (price.to_f - amount.to_f)
                    end
                  else
                    price
                  end
  return price.floor
  end


  def display_name
    code   
  end
end
