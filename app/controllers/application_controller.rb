require 'time'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  
<<<<<<< Updated upstream
  
=======
>>>>>>> Stashed changes
  def index 
    @item_posts = get_vaild_post("item")
    @job_posts = get_vaild_post("job")
    @event_posts = get_vaild_post("event")
    @categories = Post.get_categories
  end
  
end
