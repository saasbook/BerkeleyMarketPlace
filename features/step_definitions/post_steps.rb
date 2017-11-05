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

When /I create a test post/ do 
  steps %Q{
    Given I am on the create page
    Then I attach the file to "Image"
    And I fill in "Title" with "Jack Ye"
    And I fill in "Price" with "1"
    And I fill in "Description" with "In good quality"
    When I select "item" from "Category"
    Then I select "please select subcategory" from "Subcategory"
    When I press "Create Post"
    Then I should be on the details page for "Jack Ye"
  }
  
end 

Then /the post does not exists any more/ do
  
  expect()
end

# Then /^I should have image in the field "(.*)"$/ do |field|
#   file =  File.join(Rails.root, "public/images/post_default.png")
#   assert file.exists()
# end

Then("I should see {int} pages of results") do |num_pages|
    expect(page).to have_link("Last", href: "/posts?page=%s&search_terms=" %num_pages)
end

Then("I should see {int} results") do |num_results|
    expect(page).to have_css('div.card', count=num_results)
end

Then /^(?:|I )should not see any posts$/ do
  page.should have_no_css('div.card')
end

Then /^(?:|I )should see all posts$/ do
  #for each of the posts that satisfy requirements, see it on one of the pages
  step %{I should see #{Post.all.page.total_pages} pages of results}
end

Then /^(?:|I )should see all posts with category "(.*)"$/ do |searched_category|
  num_from_db = Post.where("category = ? and available = ? and expire_time > ?", searched_category, true, Time.zone.now).count
  if num_from_db >= Post.page.limit_value
    num_pages = num_from_db.fdiv(Post.page.limit_value).ceil
    step %{I should see #{num_pages} pages of results}
  else
    step %{I should see #{num_from_db} results}
  end
end

Then /^(?:|I )should see all posts with subcategory "(.*)"$/ do |searched_subcategory|
  num_from_db = Post.where("category = ? and available = ? and expire_time > ?", searched_subcategory, true, Time.zone.now).count
  if num_from_db >= Post.page.limit_value
    num_pages = num_from_db.fdiv(Post.page.limit_value).ceil
    step %{I should see #{num_pages} pages of results}
  else
    step %{I should see #{num_from_db} results}
  end
end





