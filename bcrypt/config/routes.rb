Rails.application.routes.draw do
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'session#new'
  get '/login' => 'session#create'
  get '/logout' => 'session#destroy'

end