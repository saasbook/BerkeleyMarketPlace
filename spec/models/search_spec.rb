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
          expect(valid_post.title).to eq "iClicker 1 for sale"
      end
  end
  
  it "can search by category" do
      @posts = Post.get_searched_posts("event")
      @all_events = Post.get_valid_post(:event)
      
      @all_events.each do |valid_post|
          expect(@posts).to include (valid_post)
      end      
  end
  
end
