require 'rails_helper'

RSpec.describe Wish, type: :model do
    
    before(:each) do
        @item = create :item
        @user = create :user
        @wish = create :wish
    end   
    
    it "allows user to get the wished posts" do
        expect(@user.wish_posts.first.id).to be @item.id
    end
    
    it "allows post to get the wished users" do 
        expect(@item.wish_users.first.id).to be @user.id
    end
    
    it "can be retrieved from user side" do
        expect(@user.wishs.first.id).to be @wish.id
    end
    
    it "can be retrieved from post side" do
        expect(@item.wishs.first.id).to be @wish.id
    end
    
end
