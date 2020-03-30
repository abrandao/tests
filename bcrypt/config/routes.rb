Rails.application.routes.draw do
  
  root to: 'articles#index'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :sessions

end