class PostsController < ApplicationController
  
  def post_params
    params.require(:post).permit(:title, :price, :description, :release_time, :img_name,
    :expire_time,:author_id, :category, :subcategory, :available)
  end
  
  def show 
    id = params[:id]
    @post = Post.find(id)
  end
  
  def new
    # the Create Post page
  end
  
  def create
    params[:post][:release_time] = Time.now.getutc
    params[:post][:expire_time] = nil
    params[:post][:img_name] = params[:post][:image].to_s
    params[:post][:available] = true
    # #{@post.title}
    puts params[:post]
    @post = Post.create!(post_params)
    flash[:notice] = "Post for was successfully created."
    redirect_to :controller => 'application', :action => 'index'
    # after Create form post
  end
  
  def edit
    # the Edit Post page
  end
  
  def update
    # the Update Post page
  end
  
end