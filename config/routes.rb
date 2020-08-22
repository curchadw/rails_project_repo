Rails.application.routes.draw do
  
  resources :users, except:[:new, :show] do
      resources :destinations, except:[:index, :show]
      resources :flights, only: [:update, :destroy, :create]
      resources :pilots,  only: [:update, :destroy, :create]
      resources :passengers, only: [:update, :destroy, :create]
      
  

  end

  
      get '/users/new', to: 'users#new', as: 'new_user'
      get 'login',  to: 'sessions#new', as: 'login'
      post 'login', to: 'sessions#create'
      get '/users/:id', to: 'users#show'
  
      delete 'session', to: 'sessions#destroy', as: 'logout'

      get '/users/:user_id/destinations', to: "destinations#index", as: 'destinations'
      get '/users/:user_id/destinations/:id', to: "destinations#show", as: 'destination'
  
 
      
  
 
  
  # post '/login'   to: 'sessions#create'
  # post '/signin', to: 'sessions#create'
  
 
  
  root 'static#home'
 
  #destinations
  
  #users
  
  
  

  #flights
  get '/users/:id/flights', to: 'flights#index', as: 'flights'
  get '/users/:id/flights/new', to: 'flights#new', as: 'new_flight'
  get '/users/:id/flights/:id', to: 'flights#show', as: 'flight'
  get '/users/:id/flights/:id/edit', to: 'flights#edit', as: 'edit_flight'

  #pilot
  get '/users/:id/pilots', to: 'pilots#index', as: 'pilots'
  get '/users/:id/pilots/new', to: 'pilots#new', as: 'new_pilot'
  get '/users/:id/pilots/:id', to: 'pilots#show', as: 'pilot'
  get '/users/:id/pilotss/:id/edit', to: 'pilots#edit', as: 'edit_pilot'
  
  #passenger
  get '/users/:id/pasengers', to: 'passengers#index', as: 'passengers'
  get '/users/:id/passengers/new', to: 'passengers#new', as: 'new_passenger'
  get '/users/:id/passengers/:id', to: 'passengers#show', as: 'passenger'
  get '/users/:id/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'

  


end
