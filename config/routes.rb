Rails.application.routes.draw do
  
  # root
  root 'application#index'

  # resources
  resources :posts, except: [:destroy]
  resources :users, except: [:destroy]
  resources :sessions, only: [:create, :destroy]
  
  # authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get '/logout', to: 'sessions#destroy', as: 'logout'
  
  # superuser
  get '/admin', to: 'users#admin', as: 'admin'
  get '/admin/check_application', to: 'users#admin_check_application', format: 'json'
  get '/admin/check_users', to: 'users#admin_check_users', format: 'json'
  get '/admin/check_posts', to: 'users#admin_check_posts', format: 'json'
  get '/admin/check_subscriptions', to: 'users#admin_check_subscriptions', format: 'json'
  
  # ajax calls
  get "/filter" => 'application#filter', as: 'filter', format: 'js'
  get "/update_form_subcategory" => 'posts#update_form_subcategory', as: 'update_form_subcategory', format: 'js'
  
end
