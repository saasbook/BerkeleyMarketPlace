class PostsController < ApplicationController
  
  def post_params
    params.require(:post).permit(:title, :price, :description, :release_time,
    :expire_time,:author_id, :category, :subcategory, :available, :image)
  end
  
  def show 
    id = params[:id]
    @post = Post.find(id)
    @user = User.new(email: "test@berkeley.edu")
    #@user = User.find(@post.author_id)
    
  end
  
  def new
    @empty_subcategory = ["please select category"]
    @current_subcategory = nil
    @post = Post.new
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
      if @error_message.presence
        #puts @error_message.values
        flash[:notice] = @error_message.values
        # for m in @error_message.values do
        #   flash[:notice] = m.joi
        # end
      end
      if @post.subcategory
        @empty_subcategory = Post.get_subcategories(@post.category.to_sym)
        @current_subcategory = @post.subcategory
      else
        @empty_subcategory = ["please select category"]
      end
      
      render :new
    else
      @post.save!
      params[:id] = @post.id
      redirect_to show
      # after Create form post
    end
  end
  
  
  def update_form_subcategory
    category = params[:category]
    @selected_subcategory = Post.get_subcategories(category.to_sym)
    puts @selected_subcategory
    respond_to do |format|
      format.js
    end
  end
  
  
  
  def edit
    # the Edit Post page
  end
  
  def update
    # the Update Post page
  end
  
end