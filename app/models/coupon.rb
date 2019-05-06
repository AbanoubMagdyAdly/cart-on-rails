class Coupon < ApplicationRecord
  validates :amount, presence: true ,:numericality => { greater_than_or_equal_to: 1 ,only_integer: true }
  validates :code, presence: true ,uniqueness: true
  validates :limit, presence: true
  validates :expire_at , presence: true
  
  def display_name
     code + " : " + percentage.to_s + "%"
  end
end
