require 'rails_helper'
require 'rack/test'

RSpec.describe PostsController, type: :controller do
  
  # before do
  #   Posts.any_instance.stub(:save_attached_files).and_return(true) 
  #   @attachment = FactoryGirl.create :attachment
  # end


  describe "create action" do
    current_user = User.superusers[5]
    #puts(current_user)
    it "creates a new post in database" do
      post :create, post: { 
          :title => 'Sample Post', 
          :price => '233', 
          :description => 'Sample Post Description',
          :category => 'item',
          :subcategory => 'book',
          :image => Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
      }
      expect(assigns(:post)).to be_a(Post)
    end
    
    it "won't create the post if it doesn't have title or title exceed length" do
      post :create, post: { 
          :price => '233', 
          :description => 'Sample Post Description',
          :category => 'item',
          :subcategory => 'book',
          :image => Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
      }
      expect(flash[:notice]).to be_present
      post :create, post: { 
          :title => 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
          :price => '233', 
          :description => 'Sample Post Description',
          :category => 'item',
          :subcategory => 'book',
          :image => Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
      }
      expect(flash[:notice]).to be_present
      
    end
    
    it "won't create the post if it doesn't have price or price is not number" do
      post :create, post: { 
          :title => 'Sample Post', 
          :description => 'Sample Post Description',
          :category => 'item',
          :subcategory => 'book',
          :image => Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
      }
      expect(flash[:notice]).to be_present
      post :create, post: { 
          :title => 'Sample Post', 
          :price => 'hahaha',
          :description => 'Sample Post Description',
          :category => 'item',
          :subcategory => 'book',
          :image => Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
      }
      expect(flash[:notice]).to be_present
    end

    it "won't create the post if it doesn't have category or subcategory" do
      post :create, post: { 
          :title => 'Sample Post', 
          :price => '233', 
          :description => 'Sample Post Description',
          :image => Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
      }
      expect(flash[:notice]).to be_present
      post :create, post: { 
          :title => 'Sample Post', 
          :price => '233', 
          :description => 'Sample Post Description',
          :category => 'item',
          :image => Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
      }
      expect(flash[:notice]).to be_present
    end
    
    it "redirects to the show page" do

      post :create, post: { 
          :title => 'Sample Post', 
          :price => '233', 
          :description => 'Sample Post Description',
          :category => 'item',
          :subcategory => 'book',
          :image => Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
          #File.new(Rails.root.join('spec','factories','images','doge.png'))
      }
      @post = Post.last
      id = @post.id
      expect(response).to redirect_to("/posts/" + id.to_s)
    end
  end
  
  
  
  
end
