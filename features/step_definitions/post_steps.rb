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




