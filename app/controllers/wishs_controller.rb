class WishsController < ApplicationController
    def new
        current_user.wishs << Wish.new(post_id: params[:post_id])
        id = params[:post_id]
        redirect_to "/posts/%d" % id
    end

    

end