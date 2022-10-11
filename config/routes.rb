Rails.application.routes.draw do
  
  resources :users

  # POST /signup
  post '/signup', to: 'users#create'
  # GET /me
  get '/me', to: 'users#show'

  #  POST /login
  post '/login', to: 'sessions#create'
  #  DELETE /logout
  delete '/logout', to: 'sessions#destroy'


  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
