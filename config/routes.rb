Rails.application.routes.draw do
  root 'pages#index'

  get '/profile' => 'pages#profile', as: :profile

  get '/users' => 'users#index', as: :indexing

  resources :articles

  resources :news, only: %i[index show]

  get 'users/signup' => 'users#new'

  get 'users/login' => 'sessions#new'

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'

  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user

  # api
  namespace :api do
    namespace :v1 do
      resources :pages
      resources :sessions, only: %i[create show]
      resources :users, only: %i[index create show update destroy] do
        post :activate, on: :collection
        resources :followers, only: %i[index destroy]
        resources :followings, only: %i[index destroy] do
          post :create, on: :member
        end
        resource :feed, only: [:show]
      end
      resources :microposts, only: %i[index create show update destroy]
    end
  end
end
