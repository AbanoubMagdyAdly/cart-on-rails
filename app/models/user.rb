class User < ApplicationRecord
  devise :database_authenticatable, :registerable
  # Include default devise modules.
  include DeviseTokenAuth::Concerns::User

  # TODO: change avatar to be compatible with APIs
  # mount_uploader :avatar, AvatarUploader
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  has_many :products, through: :carts
  has_many :carts
end
