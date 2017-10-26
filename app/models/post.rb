class Post < ActiveRecord::Base

    validates :image, presence: { message: "Please upload an image" }
    validates :price, numericality: { message: "Please enter a valid price." }
    validates :author_id, presence: true
    validates :description, length: { maximum: 512, message: "%{count} characters is the maximum allowed" }
    validates :title, length: { maximum: 32, message: "%{count} characters is the maximum allowed" }
    validates :category, presence: {message: "Please select category"}
    validates :subcategory, presence: {message: "Please select subcategory"}
    
    
    has_attached_file :image,
                      :storage => :cloudinary,
                      :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
                      :path => ':id/:style/:filename',
                      :styles => {
                          :thumb => "200x200#",
                      },
                      :default_url => "/images/post_default.png"
                      
                      
    validates_attachment :image,
                     content_type: { content_type: /\Aimage\/.*\z/ },
                     size: { less_than: 1.megabyte }
    
    @@categories = {
        item: [
            "book",
            "electronics",
            "music related",
            "furniture"
        ],
        event: [
            "info session",
            "performance",
            "sports",
            "speech",
            "daily life"
        ],
        job: [
            "research assistant",
            "tutor",
            "computer science",
            "daily life",
            "math",
            "performance"
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
