require 'cucumber/rspec/doubles'

Before do
  allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(true)
end