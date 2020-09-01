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
      delete '/users', to: 'users#destroy'
  
      delete 'session', to: 'sessions#destroy', as: 'logout'

      get '/users/:user_id/destinations', to: "destinations#index", as: 'destinations'
      get '/users/:user_id/destinations/:id', to: "destinations#show", as: 'destination'
  
 
      
  
 
  
  # post '/login'   to: 'sessions#create'
  # post '/signin', to: 'sessions#create'
 
  
  
  root to:'static#home'
  get "/auth/github/callback" => "github#create"
  
 
 
  #destinations
  
  #users
  
  
  

  #flights
  get '/users/:user_id/flights', to: 'flights#index', as: 'flights'
  get '/users/:user_id/flights/new', to: 'flights#new', as: 'new_flight'
  get '/users/:user_id/flights/:id', to: 'flights#show', as: 'flight'
  get '/users/:user_id/flights/:id/edit', to: 'flights#edit', as: 'edit_flight'

  #pilot
  get '/users/:user_id/pilots', to: 'pilots#index', as: 'pilots'
  get '/users/:user_id/pilots/new', to: 'pilots#new', as: 'new_pilot'
  get '/users/:user_id/pilots/:id', to: 'pilots#show', as: 'pilot'
  get '/users/:user_id/pilots/:id/edit', to: 'pilots#edit', as: 'edit_pilot'
  
  #passenger
  get '/users/:user_id/pasengers', to: 'passengers#index', as: 'passengers'
  get '/users/:user_id/passengers/new', to: 'passengers#new', as: 'new_passenger'
  get '/users/:user_id/passengers/:id', to: 'passengers#show', as: 'passenger'
  get '/users/:user_id/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'

  
  
  
end
