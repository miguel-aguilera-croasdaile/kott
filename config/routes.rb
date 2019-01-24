Rails.application.routes.draw do
  root to: 'pages#home'
  get '/checkout', to: 'orders#new'
  get '/cart', to: 'carts#show'

  resources :carts do
    resource :orders, only: [:new]
  end

  devise_for :users
  resource :user

  resources :products do
    resources :cart_items,  only: [:create]
  end

  resources :cart_items, only: [:destroy]
  resources :orders
  resources :charges

end
