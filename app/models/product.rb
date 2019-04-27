class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many   :images
  has_and_belongs_to_many :orders
  has_many :users, through: :cart
end
