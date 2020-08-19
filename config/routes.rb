Rails.application.routes.draw do
  resources :users do
      resources :flights, only: [:update, :destroy, :create]
      resources :pilots,  only: [:update, :destroy, :create]
      resources :passengers, only: [:update, :destroy, :create]
  end

  root 'static#home'

  #users
  

  #flights
  get '/users/:id/flights', to: 'flights#index', as: 'flights'
  get '/users/:id/flights/new', to: 'flights#new', as: 'new_flight'
  get '/users/:id/flights/:id', to: 'flights#show', as: 'flight'
  get '/users/:id/flights/:id', to: 'flights#edit', as: 'edit_flight'

  #pilot
  get '/users/:id/pilots', to: 'pilots#index', as: 'pilots'
  get '/users/:id/pilots/new', to: 'pilots#new', as: 'new_pilot'
  get '/users/:id/pilots/:id', to: 'pilots#show', as: 'pilot'
  get '/users/:id/pilotss/:id', to: 'pilots#edit', as: 'edit_pilot'
  
  #passenger
  get '/users/:id/pasengers', to: 'passengers#index', as: 'passengers'
  get '/users/:id/passengers/new', to: 'passengers#new', as: 'new_passenger'
  get '/users/:id/passengers/:id', to: 'passengers#show', as: 'passenger'
  get '/users/:id/passengers/:id', to: 'passengers#edit', as: 'edit_passenger'

  get '/signin',  to: 'sessions#new', as: 'sign_in'
  post '/session', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  delete '/session', to: 'sessions#destroy'


end
