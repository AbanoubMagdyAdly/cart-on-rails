class User < ApplicationRecord
  has_secure_password
  mount_uploader :avatar, AvatarUploader
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, 
  presence: true, 
  length: { in: Devise.password_length }, 
  confirmation: true, 
  on: :create 
  validates :password_digest, 
  allow_nil: true, 
  length: { in: Devise.password_length }, 
  confirmation: true, 
  on: :update
  has_many :products, through: :carts
  has_many :carts
end
