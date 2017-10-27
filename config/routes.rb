Rails.application.routes.draw do
  
  # root
  root 'application#index'

  # resources
  resources :posts, except: [:index, :destroy]
  resources :users, except: [:destroy]
  resources :sessions, only: [:create, :destroy]
  
  # authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get '/logout', to: 'sessions#destroy', as: 'logout'
  
  # ajax calls
  get "/filter" => 'application#filter', as: 'filter', format: 'js'
  get "/update_form_subcategory" => 'posts#update_form_subcategory', as: 'update_form_subcategory', format: 'js'
  
end
