Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # short hand below
  resources :articles

  # do this so instead of localhost:3000/users/new we'll get localhost:3000/signup
  get 'signup', to: 'users#new'
  
  # One way to define users path is below
  # post 'users', to 'users#create'

  # 2nd way to define path for users since we already define 'signup', to: 'users#new' above
  resources :users, except: [:new] 
  
  # sessions controller wont hit the db so we manually create these routes below
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
