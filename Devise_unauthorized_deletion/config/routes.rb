Rails.application.routes.draw do
  
  resources :cars
  root to: 'home#index'

end