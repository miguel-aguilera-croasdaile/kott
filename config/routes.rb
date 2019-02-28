Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users


  get '/cart', to: 'carts#show'
  get '/admin', to: 'pages#admin'


  resource :orders, only: [:new, :create] do
    resources :payments, only: [:new, :create]
  end

  resources :products, only: [:show, :index] do
    resources :cart_items,  only: [:create]
  end

  namespace :admin do
    resources :products
  end

end
