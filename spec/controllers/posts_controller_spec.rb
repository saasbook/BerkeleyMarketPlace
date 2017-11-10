require 'rails_helper'
require 'rack/test'

RSpec.describe PostsController, type: :controller do
  
  # before do
  #   Posts.any_instance.stub(:save_attached_files).and_return(true) 
  #   @attachment = FactoryGirl.create :attachment
  # end


  describe "create action" do
    before :each do
      create :user
      session[:user_id] = 1
    end
    
    it "creates a new post in database" do
      post :create, post: attributes_for(:item)
      expect(assigns(:post)).to be_a(Post)
    end
    
    it "won't create the post if it doesn't have title " do
      post_hash = attributes_for(:item)
      post_hash.delete(:title)
      post :create, post: post_hash
      expect(flash[:notice]).to be_present
    end
    
    it "won't create the post if title exceeds max length" do
      post_hash = attributes_for(:item)
      post_hash[:title] = "a" * 10000
      post :create, post: post_hash
      expect(flash[:notice]).to be_present
    end
    
    it "won't create the post if it doesn't have price" do
      post_hash = attributes_for(:item)
      post_hash.delete(:price)
      post :create, post: post_hash
      expect(flash[:notice]).to be_present
    end
    
    it "won't create the post if the price is not a number" do
      post_hash = attributes_for(:item)
      post_hash[:price] = "hahahaha"
      post :create, post: post_hash
      expect(flash[:notice]).to be_present
    end

    it "won't create the post if it doesn't have category" do
      post_hash = attributes_for(:item)
      post_hash.delete(:category)
      post :create, post: post_hash
      expect(flash[:notice]).to be_present
    end
    
    it "won't create the post if it doesn't have subcategory" do
      post_hash = attributes_for(:item)
      post_hash.delete(:subcategory)
      post :create, post: post_hash
      expect(flash[:notice]).to be_present
    end
    
    it "redirects to the show page" do
      post :create, post: attributes_for(:item)
      expect(response).to redirect_to("/posts/" + Post.last.id.to_s)
    end
  end
  
  describe 'searching certain item' do
    before :each do
      create :user
      session[:user_id] = 1
    end
    
    it 'calls the model method that performs search' do
      expect(Post).to receive(:get_searched_posts).with('sample')
      post :index, {:search_terms => 'sample'}
    end
  end
end
