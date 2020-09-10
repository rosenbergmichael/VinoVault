Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#google'


  resources :wines do 
    resources :reviews
  end
  resources :reviews
  resources :users do 
    resources :wines, shallow: true 
  end
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


