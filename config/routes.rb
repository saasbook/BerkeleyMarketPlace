Rails.application.routes.draw do
  
  # root
  root 'application#index'

  # resources
  resources :posts, except: [:destroy]
  resources :users, except: [:destroy]
  resources :sessions, only: [:create, :destroy]
  
  # posts
  get 'posts/:id/destroy', to: 'posts#destroy', as: 'post_destroy'
  
  # authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get '/logout', to: 'sessions#destroy', as: 'logout'
  
  # user
  get "/user/profile", to:"users#profile"
  post "/user/profile", to:"users#update_profile_pic"
  get "/user/mypost", to:"users#mypost"
  get '/admin', to: 'users#admin', as: 'admin'
  
  # ajax calls
  get "/filter" => 'application#filter', as: 'filter', format: 'js'
  get "/update_form_subcategory" => 'posts#update_form_subcategory', as: 'update_form_subcategory', format: 'js'
  
  # profile
  get "/user/profile", to:"users#profile"
  post "/user/profile", to:"users#update_profile_pic"
  get "/user/mypost", to:"users#mypost"
  get '/user/posts/:id', to: 'posts#show'
end
