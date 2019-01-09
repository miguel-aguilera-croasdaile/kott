Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resource :user do
    resources :carts, only: [:show]
  end
  resources :products do
    resources :cart_items,  only: [:create]
  end
  resources :cart_items, only: [:destroy]
  resources :orders do
    resources :charges
  end
end
