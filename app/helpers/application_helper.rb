module ApplicationHelper
    
    def get_vaild_post category
       return Post.where(available:true, category: category).where("expire_time > ? OR expire_time IS ?", Time.now, nil) 
    end
end
