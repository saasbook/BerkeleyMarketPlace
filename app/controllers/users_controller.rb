class UsersController < ApplicationController
    
    def admin 
        check_superuser
    end
    
    def profile
        @current_user = current_user
        if @current_user.image.url.nil?
            @profile_img = "/images/post_default.png"
        else
            @profile_img = current_user.image.url(:medium)
        end
    end
    
    def update_profile_pic
        @profile_pic = params[:user][:image]
        @current_user = current_user
        @current_user.update_attribute(:image, @profile_pic)
        @current_user.save!
        redirect_to action:"profile"
    end
    
    def mypost
        @mypost = Post.get_user_posts(current_user.id)
        if @mypost.nil?
            @view_to_render = 'users/empty_post_grid'
        else
            @view_to_render = 'users/mypost_grid'
        end
    end
    
end

