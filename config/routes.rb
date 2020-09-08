Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login

  #logout

  resources :reviews
  resources :users
  resources :wines
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
