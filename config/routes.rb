Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#index'
      post '/sessions', to: 'sessions#create'
      post '/users', to: 'users#create'
      post '/road_trip', to: 'roadtrips#create'
    end
  end
end
