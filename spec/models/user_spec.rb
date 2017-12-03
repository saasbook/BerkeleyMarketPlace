require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'user validation' do
    
    it "successfully creates user" do
      user = create :user
      expect(User.last.email).to eq user.email
      
    end
    
    it "does not allow non-berkeley email" do 
      user_hash = attributes_for(:user)
      user_hash[:email] = "invalid@fake.berkeley.edu"
      expect { User.create!(user_hash) }.to raise_exception
    end
    
    it "verifies superuser" do 
      user = create :superuser
      expect(user.superuser?).to be true
    end
    
  end
  
  
end