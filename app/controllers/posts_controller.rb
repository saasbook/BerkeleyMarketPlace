class PostsController < ApplicationController
  
  def post_params
    params.require(:post).permit(:title, :price, :description, :release_time,
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
    params[:post][:author_id] = 233
    @post = Post.new(post_params)
    
    if not @post.valid? # => false
      @error_message = @post.errors.messages
      if @error_message[:image].presence
        flash[:notice] = @error_message[:image]
      end
      if @error_message[:price].presence
        flash[:notice] = @error_message[:price]
      end
      render :new
    else
      if @post.save
        params[:id] = @post.id
        redirect_to show
      # else
      #   flash[:notice] = "Error creating new Post!"
      #   render :new
      end
    # after Create form post
    end
  end
  
  def edit
    # the Edit Post page
  end
  
  def update
    # the Update Post page
  end
  
end