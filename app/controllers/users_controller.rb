class UsersController < ApplicationController
    
    def user_params
        params.require(:user).permit(:email, :admin)
    end
    
    def admin 
        @admins = User.get_superuser
        @user = User.new
    end
    
    
    
    
    # def destroy 
    #     @user = User.find(params[:id])
    #     @user.update_attribute(:admin, false)
    #     # User.find(params[:id]).destroy
    #     flash[:success] = "User deleted"
    #     redirect_to admin_url
    # end
    
    def show 
        @user = User.find(params[:id])
        @user.update_attribute(:admin, false)
        # User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to admin_url
    end
    
    
    def create

        params[:user][:admin] = true
        @user = User.new(user_params)
        
        if not @user.valid? 
          @error_message = @user.errors.full_messages
          if @error_message.presence
            redirect_to admin_url
            flash[:notice] = @error_message[0]
          end
        else
          @user.save! 
          redirect_to admin_url
        end
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
        @mypost = current_user.posts
        if @mypost.nil?
            @view_to_render = 'users/empty_post_grid'
        else
            @view_to_render = 'users/mypost_grid'
        end
    end
    
    def mywishlist
        @mywishs = current_user.wish_posts
        if @mywishs.nil?
            @view_to_render = 'users/empty_post_grid'
        else
            @view_to_render = 'users/mywishlist_grid'
        end
    end
end

