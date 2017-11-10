require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe 'post validation and redirection' do
    before(:each) do
        @post = create :item
        @user = create :user
    end   
    
    it "has title feature" do 
        expect(Post.first.title).to eq @post.title
    end
    
    it "has price feature" do
        expect(Post.first.price).to eq @post.price
    end
    
    it "has image feature" do
        expect(Post.first.price).not_to eq nil
    end
    
    it "can search subcategory based on category" do
      expect(Post.first.category).to eq @post.category
      expect(Post.first.subcategory).to eq @post.subcategory
      expect(Post.get_subcategories(Post.first.category)).to include(Post.first.subcategory)
    end
    
    it "can get user's post based on user id" do
        expect(Post.get_user_posts(@user.id).length).to eq 1
    end
    
    it "can get posts in the same category" do
        posts = Post.get_valid_post(:item)
        posts.each do |valid_post|
            expect(valid_post.category).to eq "item"
        end
    end
  end 
  describe 'searching' do
    before(:each) do
        create :item
        create :event
        create :job
    end   
    
    it "can be searched by title" do
        posts = Post.get_searched_posts("title")
        expect(posts.count).to eq 3
        posts = Post.get_searched_posts("item")
        expect(posts.count).to eq 1
    end
    
    it "can be searched by description" do
        posts = Post.get_searched_posts("description")
        expect(posts.count).to eq 3
        posts = Post.get_searched_posts("item")
        expect(posts.count).to eq 1
    end
    
    it "can be searched by subcategory" do
        posts = Post.get_searched_posts("performance")
        expect(posts.count).to eq 1
    end
  end
end
