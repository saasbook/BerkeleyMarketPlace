require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
        Post.new(
            :title => 'iClicker', 
            :price => '233', 
            :description => 'Sample Post Description',
            :category => 'item',
            :subcategory => 'book',
            :author_id => 1,
            :release_time => '2017-01-01 23:00:00 UTC',
            :available => true)
        Post.new(
            :title => 'concert', 
            :price => '233', 
            :description => 'Sample Post Description',
            :category => 'event',
            :subcategory => 'music',
            :author_id => 1,
            :release_time => '2017-01-01 23:00:00 UTC',
            :available => true)
        Post.new(
            :title => 'career fair', 
            :price => '233', 
            :description => 'Sample Post Description',
            :category => 'event',
            :subcategory => 'job',
            :author_id => 1,
            :release_time => '2017-01-01 23:00:00 UTC',
            :available => true)
  end   
  
  it "can search by keywords" do
      @posts = Post.get_searched_posts("iclicker")
      @posts.each do |valid_post|
          expect(valid_post.title).to eq "iClicker1 for sale"
      end
  end
  
  it "can search by category" do
      @posts = Post.get_searched_posts("event")
      @posts.each do |valid_post|
          expect(valid_post.category).to eq "event"
      end
  end
  
  
end
