class Coupon < ApplicationRecord
    def display_name
     code + " : " + percentage.to_s + "%"
   end
end
