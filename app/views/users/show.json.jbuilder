json.partial! "users/user", user: @user
json.extract! @user, :id, :name, :email, :address, :avatar, :created_at, :updated_at