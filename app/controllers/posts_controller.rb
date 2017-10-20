class PostsController < ApplicationController
  
  def post_params
    params.require(:post).permit(:title, :price, :description, :release_time, :img_name,
    :expire_time,:author_id, :category, :subcategory, :available, :image)
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
    params[:post][:available] = true
    params[:post][:img_name] = params[:post][:image].to_s
    @post = Post.new(post_params)
    
    # if params[:post][:img_name] == ""
    if params[:post][:img_name] == ""
      flash[:notice] = "Please Upload Image"
        #render :new
      render :new
    end

    if @post.save
      flash[:notice] = "Post for #{@post.title} was successfully created."
      params[:id] = @post.id
      redirect_to posts_path
    else
      flash[:notice] = "Error creating new Post!"
      render :new
    end
    # after Create form post
  end
  
  def edit
    # the Edit Post page
  end
  
  def update
    # the Update Post page
  end
  
end