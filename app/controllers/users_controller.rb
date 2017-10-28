class UsersController < ApplicationController
    
    helper_method :check_superuser
    
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
    
end

