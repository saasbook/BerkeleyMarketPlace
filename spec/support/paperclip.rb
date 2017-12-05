RSpec.configure do |config|  
  config.before(:each) do
    allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(true)
  end
end