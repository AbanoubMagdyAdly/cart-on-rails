Rails.application.routes.draw do
  resources :users
  resources :stores
  resources :coupons
  resources :products
  resources :brands
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
