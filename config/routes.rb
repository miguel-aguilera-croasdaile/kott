Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :users, :only => [:show]

  resources :products do
    post 'add_to_cart'
  end

end
