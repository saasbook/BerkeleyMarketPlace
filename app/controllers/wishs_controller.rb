class WishsController < ApplicationController
    def new
        current_user.wishs << Wish.new(post_id: params[:post_id])
        id = params[:post_id]
        redirect_to "/posts/%d" % id
    end
    
    def delete
        id = params[:id]
        post_id = params[:post_id]
        Wish.find(id).destroy
        redirect_to "/posts/%d" % post_id
    end
    

end