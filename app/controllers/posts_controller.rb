class PostsController < ApplicationController
  
  def post_params
    params.require(:post).permit(:title, :price, :description, :release_time, :img_name,
    :expire_time,:author_id, :category, :subcategory, :available, :image)
    #:image)
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
    #@uploadimg = Cloudinary::Uploader.upload(params[:post][:image])
    params[:post][:img_name] = params[:post][:image].to_s
    @post = Post.new(post_params)
    # if @post.image == nil
    #   flash[:notice] = "Please upload an image!"
    #   render :new
    # end
    
    if @post.save
      flash[:notice] = "Post for #{@post.title} was successfully created."
      redirect_to :controller => 'application', :action => 'index'
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