Rails.application.routes.draw do
  root 'microposts#index'
  get '/help',  to: 'first_pages#help'
  get '/about', to: 'first_pages#about'
  get '/contact', to: 'first_pages#contact'
  get '/makepost', to: 'microposts#makepost'
  get '/new', to: 'sessions#new'
  get '/signup', to: 'users#signup'
  get '/show', to: 'users#show'
  get '/index', to: 'users#index'
  post '/login',   to: 'sessions#create'
  post '/out', to: 'sessions#logout'
  post '/sign', to: 'users#create'
  post '/users/guest_sign_in', to: 'users#new_guest'
  # delete 'delete', to: 'users#destroy'
  resources :microposts
  # resources :microposts do
  #   resource :favorites, only: [:create, :destroy]
  # end
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  resources :edit_update
  resources :users, only: %i[show edit update index]
  resources :messages, only: [:create]
  resources :rooms, only: %i[create show]
  resources :users do
    member do
      get :following, :followers
      get :favorites
    end
  end
  resources :relationships, only: %i[create destroy]
  # resources :microposts, only: [:index]
  # delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
