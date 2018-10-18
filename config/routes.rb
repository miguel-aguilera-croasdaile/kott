Rails.application.routes.draw do
  root to: 'pages#home'
  get '/my_cart', to: 'carts#show'
  devise_for :users
  resources :carts, :only => [:show]
  resources :products do
    post 'add_to_cart'
  end
  resources :orders
end
