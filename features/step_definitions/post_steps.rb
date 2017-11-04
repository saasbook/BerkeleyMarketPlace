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



Then /^(?:|I )should not see any posts$/ do
  page.should have_no_css('div.card')
end

Then /^(?:|I )should see all posts$/ do
  Post.all.each do |post|
    # byebug
    if post.available == true 
      if post.expire_time 
        step %{I should see "#{post.title}"} unless post.expire_time.utc.strftime( "%H%M%S%N" ) < Time.now.utc.strftime( "%H%M%S%N" )
      else
        step %{I should see "#{post.title}"}
      end
    end
  end
end

Then /^(?:|I )should see all posts with category "(.*)"$/ do |searched_category|
  Post.all.each do |post|
    if post.category == searched_category and post.available == true
      if post.expire_time 
        step %{I should see "#{post.title}"} unless post.expire_time.utc.strftime( "%H%M%S%N" ) < Time.now.utc.strftime( "%H%M%S%N" )
      else
        step %{I should see "#{post.title}"}
      end
    end
  end
end

Then /^(?:|I )should see all posts with subcategory "(.*)"$/ do |searched_subcategory|
  Post.all.each do |post|
    if post.subcategory == searched_subcategory and post.available == true 
      if post.expire_time 
        step %{I should see "#{post.title}"} unless post.expire_time.utc.strftime( "%H%M%S%N" ) < Time.now.utc.strftime( "%H%M%S%N" )
      else
        step %{I should see "#{post.title}"}
      end
    end
  end
end




