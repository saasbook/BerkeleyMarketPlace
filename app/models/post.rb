class Post < ActiveRecord::Base
    #attr_accessor :title, :price, :description, :release_time, :expire_time, :author_id, :category, :subcategory, :available
    has_attached_file :image
    validates_attachment :image,
                     content_type: { content_type: /\Aimage\/.*\z/ },
                     size: { less_than: 1.megabyte }
end
