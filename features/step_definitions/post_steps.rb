When /^(?:|I )select "(.*)" from "(.*)"$/ do |value, field|
  select(value, :from => field)
  # PostsController.update_form_subcategory
end

# When /^(?:|I )select "(.*)" from subcategory$/ do |value|
  
#   page.find_by_id('post_subcategory').find("option[value='book']").select_option
#     # select value, :from => field
# end

Then /^(?:|I )should see "(.*)" in the field "(.*)"$/ do |val, field|
    expect(find_field(field).value).to eq val
end

Then /^(?:|I )attach the file to "(.*)"$/ do |field|
    attach_file(field, File.join(Rails.root, "public/images/post_default.png"))
end

When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

# Then /^I should have image in the field "(.*)"$/ do |field|
#   file =  File.join(Rails.root, "public/images/post_default.png")
#   assert file.exists()
# end