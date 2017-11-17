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
    
    def self.default_filterrific_values
       {
           is_available: "true",
           search_query: "",
           sorted_by: "",
           choose_category: "all_all"
       } 
    end
                     
    filterrific :default_filter_params => default_filterrific_values,
                :available_filters => [
                  :is_available,
                  :search_query,
                  :choose_category,
                  :sorted_by,
                ]
                
    has_many :wish_users, :through => :wishs, :source => :user
    has_many :wishs
    belongs_to :user, :foreign_key => "author_id"

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
    
    @@empty_subcategory = ["please select a category first"]
    
    scope :is_available, lambda { | val |
       if val != "all"
            available = (val == "true")
            where(available: available)
        end
    }
    
    scope :search_query, lambda { | query |
        get_searched_posts(query)
    }
    
    scope :sorted_by, lambda { |sort_option|
        # extract the sort direction from the param value.
        direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
        case sort_option.to_s
        when /^release_time/
          order("release_time #{ direction }")
        when /^price/
          order("price #{ direction }")
        else
          raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
        end
    }
    
    scope :choose_category, lambda { |option|
        category = option.split("_")[0]
        subcategory = option.split("_")[1]
        if category != "all"
            if subcategory == "all"
                where('category = ?', category)
            else
                where('category = ? AND subcategory = ?', category, subcategory)
            end
        end
    }
    
    def self.complete_filterrific_params incomplete_params
        
        if incomplete_params.nil?
            return default_filterrific_values
        end
        
        for key in default_filterrific_values.keys do
            if not incomplete_params.key? key
                incomplete_params[key] = default_filterrific_values[key]
            end
        end
        return incomplete_params
    end
    
    def self.options_for_is_available
        [
            ["All", "all"],
            ["Yes", "true"], 
            ["No", "false"]
        ]
    end
    
    def self.options_for_choose_category
       lst = []
       lst.push ["All", "all_all"]
       lst.push ["Items", "item_all"]
       lst.concat @@categories[:item].map { |v| [("&nbsp;"*4).html_safe + v, "item_" + v] } 
       lst.push ["Events", "event_all"]
       lst.concat @@categories[:event].map { |v| [("&nbsp;"*4).html_safe + v,"event_" + v] } 
       lst.push ["Jobs", "job_all"]
       lst.concat @@categories[:job].map { |v| [("&nbsp;"*4).html_safe + v,"job_" + v] }
    end
    
    
      
    def self.options_for_sorted_by
        [
            ['price: lowest first', 'price_asc'],
            ['price: highest first', 'price_desc'],
            ['time: latest first', 'release_time_desc'],
            ['time: oldest first', 'release_time_asc']
        ]
    end
    
    def short_title 
        title.truncate(32)
    end
    
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
