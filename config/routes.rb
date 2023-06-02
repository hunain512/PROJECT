Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :stores 
  root 'pages#index'
  resources :categories 
  resources :items 
  resources :users 
  post 'carts/add_item', to: 'carts#add_item', as: 'add_item_to_cart'
  delete 'carts/remove_item', to: 'carts#remove_item', as: 'remove_item_from_cart'
  post 'carts/increase_item_quantity', to: 'carts#increase_item_quantity', as: 'increase_item_quantity'
  post 'carts/decrease_item_quantity', to: 'carts#decrease_item_quantity', as: 'decrease_item_quantity'
  post '/checkout/:store_id', to: 'orders#checkout', as: 'checkout'
  get '/orders', to: 'orders#index'
end   