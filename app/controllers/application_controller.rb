require 'time'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception unless Rails.env.test?
  # protect_from_forgery with: :null_session
  
  helper_method :current_user, :check_superuser

  def current_user
    if Rails.env.test?
      @current_user = User.find_by_id(1)
    else
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
  end
  
  def check_superuser
    if not current_user.superuser?
      redirect_to controller: 'application', action: 'index', notice: "You are not allowed to access the page"
    end
  end

  def index 
    @posts = Post.get_all_valid_posts
    @categories = Post.get_categories
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
