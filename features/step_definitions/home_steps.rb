Given /the following posts exist/ do |post_table|
  post_table.hashes.each do |post|
    Post.create post
  end
end

# Then /I should see "(.*)"/ do |item_name|
#   page.should have_content(item_name)
# end

# Then /I should see "(.*)" but not "(.*)"/ do |item_name, not_exist|
#   page.should have_content(item_name) and page.should have_no_content(not_exist)
# end