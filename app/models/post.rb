class Post < ActiveRecord::Base
<<<<<<< Updated upstream
=======
    #attr_accessor :title, :price, :description, :release_time, :expire_time, :author_id, :category, :subcategory, :available
    
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

>>>>>>> Stashed changes
end
