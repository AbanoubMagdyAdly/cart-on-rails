Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  resources :stores
  resources :coupons
  resources :products
  resources :brands
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
