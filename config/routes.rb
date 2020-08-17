Rails.application.routes.draw do
  resources :users do
      resources :flights
      resources :pilots
      resources :passengers
  end

  root 'static#home'
end
