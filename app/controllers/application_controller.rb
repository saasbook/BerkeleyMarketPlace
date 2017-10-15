require 'time'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  
  
  def index 
    @item_posts = get_vaild_post("item")
    @job_posts = get_vaild_post("job")
    @event_posts = get_vaild_post("event")
  end
  
end
