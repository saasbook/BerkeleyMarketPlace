class Post < ActiveRecord::Base
    include PgSearch
    pg_search_scope :search_for_post, :against => {:title => 'A', :category => 'B', :subcategory => 'C', :description => 'D'}, :using => {:tsearch => {:prefix => true}, :dmetaphone => {}, :trigram => {:threshold => 0.1}}
  
    validates :image, presence: { message: "Please upload an image" }
    validates :price, numericality: { message: "Please enter a valid price." }
    validates :author_id, presence: true
    validates :description, length: { maximum: 4096, message: "%{count} characters is the maximum allowed" }
    validates :title, presence: true
    validates :title, length: { maximum: 128, message: "%{count} characters is the maximum allowed" }
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
    
    @@empty_subcategory = ["please select subcategory"]
    
    def self.get_categories
        @@categories.keys
    end
    
    def self.get_empty_subcategory
        @@empty_subcategory
    end
    
    def self.get_subcategories category
        @@categories[category.to_sym]
    end
    
    def self.get_valid_post category
       self.where(available: true, category: category.to_sym)
    end
    
    def self.get_all_valid_posts
        self.where(available: true)
    end
    
    def self.get_searched_posts(search_terms)
        self.search_for_post(search_terms)
    end
    
    def self.get_user_posts user_id
        result = self.where(author_id: user_id)
    end
    
    def self.get_release_timeseries
        ps = self.select(:release_time, :category).sort.map { |po| {date: po.release_time.change(min:0), category: po.category} }
        return ps.sort_by { |hsh| hsh[:date] }
    end

end
