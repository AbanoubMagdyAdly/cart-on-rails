class User < ApplicationRecord
  has_secure_password
  has_many :products, through: :carts
  has_many :carts
end
