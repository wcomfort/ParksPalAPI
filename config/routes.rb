Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parks, only: [:index, :create, :show]
  resources :users, only: [:index, :create, :show]
  resources :favorites, only: [:index, :create]
  resources :comments, only: [:index, :create] 
  post '/login', to: 'application#login'
  post '/users/:id', to: 'users#show'
  post '/create_account', to: 'users#create'
  post '/park/business', to: 'parks#getBusiness' 
  post '/favorites', to: 'favorites#create'
end
