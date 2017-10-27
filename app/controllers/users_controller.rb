class UsersController < ApplicationController
    def profile
    end
    
    def mypost
        @mypost = Post.get_vaild_post(:item) #hardcoded for now
        # @mypost = Post.get_user_posts(:author_id)
    end
    
    def mywishlist
        @mywishlist = Post.get_vaild_post(:item) #hardcoded for now
    end
    
    def notification
    end
end
