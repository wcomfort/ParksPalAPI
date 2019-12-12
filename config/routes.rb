Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parks, only: [:index, :create]
  resources :users, only: [:index, :create]
  resources :favorites, only: [:index, :create]
  resources :comments, only: [:index, :create] 
  post '/park/business', to: 'parks#getBusiness' 
end
