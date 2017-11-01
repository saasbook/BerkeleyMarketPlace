require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
      @post = Post.new(
                    :title => 'Sample Post', 
                    :price => '233', 
                    :description => 'Sample Post Description',
                    :category => 'item',
                    :subcategory => 'book',
                    :author_id => 1,
                    :release_time => '2017-01-01 23:00:00 UTC',
                    :available => true)
  end   
  
  it "has title feature" do 
      expect(@post.title).to eq 'Sample Post'
  end
  
  it "has price feature" do
      expect(@post.price).to eq '233'
  end
  
  it "has image feature" do
      expect(@post.image).not_to eq nil
  end
  
  it "can search subcategory based on category" do
      expect(Post.get_subcategories(:item)[0]).to eq 'book'
      expect(Post.get_subcategories(:item).length).to be >= 1
  end
  
  it "can get user's post based on user id" do
      expect(Post.get_user_posts(1).length).to be >= 1
  end
  
  it "can get posts in the same category" do
      @posts = Post.get_valid_post(:item)
      @posts.each do |valid_post|
          expect(valid_post.category).to eq "item"
      end
  end
end
