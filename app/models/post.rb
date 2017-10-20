class Post < ActiveRecord::Base

    #attr_accessor :title, :price, :description, :release_time, :expire_time, :author_id, :category, :subcategory, :available
    has_attached_file :image,
                      :storage => :cloudinary,
                      :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
                      :path => ':id/:style/:filename',
                      :styles => {
                              :thumb => "100x100#",
                              :small  => "150x150>",
                              :medium => "200x200" }
                      
                      
    validates_attachment :image,
                     content_type: { content_type: /\Aimage\/.*\z/ },
                     size: { less_than: 1.megabyte }
    
    @@categories = {
        item: [
            "textbook",
            "electronics"
        ],
        event: [
            "info session",
            "performance"
        ],
        job: [
            "research assistant",
            "tutor"
        ]
    }
    
    def self.get_categories
        @@categories.keys
    end
    
    def self.get_subcategories category
        @@categories[category]
    end
    
    def self.get_vaild_post category
       self.where(available:true, category: category).where("expire_time > ? OR expire_time IS ?", Time.now, nil) 
    end
    
    def self.get_all_valid_posts
       self.where(available:true).where("expire_time > ? OR expire_time IS ?", Time.now, nil) 
    end
    
end

# add_attachment :post, :image