class PostsController < ApplicationController
  
  def post_params
    params.require(:movie).permit(:title, :price, :description, 
    :release_time, :expire_time, :category, :subcategory, :available)
  end
  
  def show 
    # the Detail page
  end
  
  def new
    # the Create Post page
  end
  
  def create
    # after Create form post
  end
  
  def edit
    # the Edit Post page
  end
  
  def update
    # the Update Post page
  end
  
end