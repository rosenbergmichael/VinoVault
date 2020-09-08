Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout
  delete '/logout' => 'sessions#destroy'

  resources :reviews
  resources :users
  resources :wines
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
