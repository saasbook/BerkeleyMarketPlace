# And /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
#   fill_in(field, :with => value)
# end

# And /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
#   select(value, :from => field)
# end

# Then /^(?:|I )should see "(.*)" in the field "(.*)"$/ do |value, field|
#     pending
# #   if page.respond_to? :should
# #     page.should have_content(value)
# #   else
# #     assert page.has_content?(value)
# #   end
# end

# Then /^(?:|I ) upload image$/ do
#     pending
# end

# Then /^(?:|I )should be on (.+) for "(.*)"$/ do |page_name, item_name|
#   current_path = URI.parse(current_url).path
#   if current_path.respond_to? :should
#     current_path.should == path_to(page_name)
#   else
#     assert_equal path_to(page_name), current_path
#   end
#   step %{I should see item_name} 
# end




