Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: "homes#index"
  ActiveAdmin.routes(self)
  resources :users
  resources :stores
  resources :coupons
  resources :products
  resources :brands
  resources :categories
  resources :carts
  resources :orders
  get '/*buyer', to: 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
