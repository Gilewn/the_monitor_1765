Rails.application.routes.draw do
  root 'pages#index'

  get '/profile' => 'pages#profile', as: :profile

  get '/users' => 'users#index', as: :indexing

  resources :articles

  resources :news

  get 'users/signup' => 'users#new'

  get 'users/login' => 'sessions#new'

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
