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
    :author_id, :category, :subcategory, :available, :image)
  end
  
  def show 
    id = params[:id]
    @post = Post.find(id)
    @user = User.find(@post.author_id)
    @release_time_formatted = @post.release_time.strftime("(released %B %d, %Y, %I%p)")
  end
  
  def new
    @empty_subcategory = Post.get_empty_subcategory
    @current_subcategory = nil
    @post = Post.new
    # the Create Post page
  end
  
  def create

    params[:post][:release_time] = Time.now.getutc
    params[:post][:available] = true
    params[:post][:author_id] = current_user.id
    @post = Post.new(post_params)
    
    #puts(current_user.id)
    
    if not @post.valid? # => false
      @error_message = @post.errors.messages
      if @error_message.presence
        flash[:notice] = @error_message.values
      end
      
      if @post.category && @post.subcategory
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
    logger.debug "current filterrific params: %s" % params[:filterrific]
    @filterrific = initialize_filterrific(
      Post,
      params[:filterrific] || Post.default_filterrific_values,
      :select_options => {
        sorted_by: Post.options_for_sorted_by,
        choose_category: Post.options_for_choose_category,
      }
    ) or return
    @posts = @filterrific.find.page(params[:page])
  
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def search
    redirect_to action: :index, filterrific: {search_query: params[:search_terms]}
  end
  
  
  def edit
    # the Edit Post page
    id = params[:id]
    @post = Post.find(id)
    @avilability = "available"
    if @post.available == false
      @avilability = "unavailable"
    end
    
  end
  
  def update
    # the Update Post page
    id = params[:id]
    @post = Post.find(id)
    params[:post][:author_id] = current_user.id
    if params[:post][:available] == "available"
      params[:post][:available] = true
    else
      params[:post][:available] = false
    end
    @post.update_attributes!(post_params)
    flash[:notice] = "#{@post.title} was successfully updated."
    redirect_to action:"show", id: @post.id
  end
  
  def mark_as_sold
    id = params[:id]
    @post = Post.find(id)
    @post.update_attribute(:available, false)
    flash[:notice] = "#{@post.title} was successfully marked as sold."
    redirect_to "/user/mypost"
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