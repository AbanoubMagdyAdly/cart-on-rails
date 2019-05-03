class Store < ApplicationRecord
  belongs_to :admin_user
  has_and_belongs_to_many :products
end