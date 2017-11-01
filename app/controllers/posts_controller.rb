class PostsController < ApplicationController
  
  helper_method :safe_url

  def safe_url url
    if not(url.include? "https")
      url = url.sub("http", "https")
    end
    url
  end
  
  
  
  def post_params
    params.require(:post).permit(:title, :price, :description, :release_time,
    :expire_time,:author_id, :category, :subcategory, :available, :image)
  end
  
  def show 
    id = params[:id]
    @post = Post.find(id)
    @user = User.find(@post.author_id)
  end
  
  def new
    @empty_subcategory = Post.get_empty_subcategory
    @current_subcategory = nil
    @post = Post.new
    # the Create Post page
  end
  
  def create

    params[:post][:release_time] = Time.now.getutc
    params[:post][:expire_time] = nil
    params[:post][:available] = true
    params[:post][:author_id] = current_user.id
    @post = Post.new(post_params)
    
    #puts(current_user.id)
    
    if not @post.valid? # => false
      @error_message = @post.errors.messages
      if @error_message.presence
        flash[:notice] = @error_message.values
      end
      
      if @post.subcategory
        @empty_subcategory = Post.get_subcategories(@post.category.to_sym)
        @current_subcategory = @post.subcategory
      else
        @empty_subcategory = Post.get_empty_subcategory
      end
      
      render :new
    else
      @post.save! # should not error, because it is already valid
      redirect_to action:"show", id: @post.id
    end
  end
  
  
  def update_form_subcategory
    category = params[:category]
    
    if category == ""  # empty string, selected nothing
      @selected_subcategory = Post.get_empty_subcategory
    else
      @selected_subcategory = Post.get_subcategories(category)
    end
    
    puts @selected_subcategory
    respond_to do |format|
      format.js
    end
  end
  
  def index
    @categories = Post.get_categories
    
    category = params[:category]
    subcategory = params[:subcategory]
    
    # if params.has_key?(:search_terms) #user is trying to search something
    #   posts = Post.get_searched_posts(params[:search_terms])
    # else
    #   posts = Post.get_all_valid_posts
    # end
 
    posts = Post.get_all_valid_posts
    
    if category
      posts = posts.where("category = ?", category)
    end
    
    if subcategory
      @posts = posts.where("subcategory = ?", subcategory)
    else
      @posts = posts
    end
  end
  
  
  def edit
    # the Edit Post page
  end
  
  def update
    # the Update Post page
  end
  
  def get_subcategories
    #get_subcategories category
    @subcategories = Post.get_subcategories params[:category_id]
    respond_to do |format|
      format.js
    end
  end
  
  def destroy
    check_superuser
    id = params[:id]
    Post.destroy(id)
    redirect_to("/", flash: { notice: "Post #{id} is removed from the database by admin"})
  end

end