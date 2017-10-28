class UsersController < ApplicationController
    
    helper_method :check_superuser
    helper_method :current_user

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def check_superuser
        if not current_user.superuser?
            flash[:notice] = "You are not allowed to access the page"
            redirect_to controller: 'application', action: 'index'
        end
    end
    
    # used for superuser
    def admin 
        check_superuser
        # render application monitor by default
        # redirect_to action: 'admin_check_application'
    end
    
    def admin_check_application
        
        respond_to do |format|
            format.json {
                render :json => [1,2,3,4,5]
            }
        end
    end
    
    def admin_check_users
        
        respond_to do |format|
            format.json {
                render :json => [1,2,3,4,5]
            }
        end
    end
    
    def admin_check_posts
        
        respond_to do |format|
            format.json {
                render :json => [1,2,3,4,5]
            }
        end
    end
    
    def admin_check_subscriptions
        
        respond_to do |format|
            format.json {
                render :json => [1,2,3,4,5]
            }
        end
    end
    
    def profile
    end
    
    def update_profile_pic
        @profile_pic = params[:image]
        puts(current_user.image)
        current_user.update_attribute(:image, params[:image])
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

