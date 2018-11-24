Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :carts, :only => [:show]
  resources :products do
    resources :cart_items,  only: :create
  end
  resources :orders
end
