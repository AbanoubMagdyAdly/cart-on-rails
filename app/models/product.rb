class Product < ApplicationRecord
  mount_uploaders :product_images, ProductImagesUploader
  belongs_to :category
  belongs_to :brand
  belongs_to :store
  has_many   :images
  # has_and_belongs_to_many :orders
  has_many :users, through: :carts
  has_many :carts
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true  ,:numericality => { greater_than_or_equal_to: 0 }
  validates :in_stock, presence: true  ,:numericality => { greater_than_or_equal_to: 0 }
  


  
end
