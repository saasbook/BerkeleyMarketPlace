Rails.application.routes.draw do
  
  # root
  root 'application#index'

  # resources
  resources :posts, except: [:destroy] do
    resources :wishs, except: [:destroy]
  end
  resources :users
  resources :sessions, only: [:create, :destroy]
  
  # category
  get '/category/:category_id', to: 'application#category', as: 'category'
  get '/category/:category_id/subcategory/:subcategory_id', to: 'application#subcategory', as: 'subcategory'
  
  # posts
  get 'posts/:id/destroy', to: 'posts#destroy', as: 'post_destroy'
  get 'search-posts', to: 'posts#search', as: 'post_search'
  get "posts/:id/mark_as_sold", to: "posts#mark_as_sold", as: 'mark_post_as_sold'
  
  # authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get '/logout', to: 'sessions#destroy', as: 'logout'
  
  # user
  get '/admin', to: 'users#admin', as: 'admin'
  
  # ajax calls
  get "/update_form_subcategory" => 'posts#update_form_subcategory', as: 'update_form_subcategory', format: 'js'
  
  # profile
  get "/user/profile", to:"users#profile"
  post "/user/profile", to:"users#update_profile_pic"
  get "/user/mypost", to:"users#mypost"
  get "/user/mywishlist", to:"users#mywishlist"

  # wishs
  get "/posts/:post_id/wishs/:id/delete", to:"wishs#delete", as:"delete_from_wish"

end
