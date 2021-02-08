Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/nyt', to: 'api#nyt'
  post '/google', to: 'api#google'
  post '/login', to: 'login#login'

  resources :users, only: [:create, :show]
  resources :collections, only: [:create]
  resources :books, only: [:create, :update, :destroy]
end
