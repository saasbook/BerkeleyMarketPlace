require 'time'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception unless Rails.env.test?
  # protect_from_forgery with: :null_session
  
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def index 
    @posts = Post.get_all_valid_posts
    @categories = Post.get_categories
  end
  
  def search
    @categories = Post.get_categories
    
    category = params[:category]
    subcategory = params[:subcategory]
 
    if params.has_key?(:search_terms) #user is trying to search something
       posts = Post.get_searched_posts(params[:search_terms])
    else
       posts = Post.get_all_valid_posts
    end
    
    if subcategory
      posts = posts.where("category = ?", category)
    end
    
    if subcategory
      @posts = posts.where("subcategory = ?", subcategory)
    else
      @posts = posts
    end
    # redirect_to root_path
    
  end
  
  def filter
    category = params[:category]
    if category == "all"
      @selected = Post.get_all_valid_posts
    else
      @selected = Post.get_vaild_post(category)
    end
    respond_to do |format|
      format.js
    end
  end
  
end
