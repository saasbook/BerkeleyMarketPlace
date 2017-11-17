When /^(?:|I )select "(.*)" from "(.*)"$/ do |value, field|
  select(value, :from => field)
end

Then /^(?:|I )should see "(.*)" in the field "(.*)"$/ do |val, field|
    expect(find_field(field).value).to eq val
end

Then /^(?:|I )should not see "(.*)" in the field "(.*)"$/ do |val, field|
    expect(find_field(field).value).not_to eq val
end

Then /^(?:|I )attach the file to "(.*)"$/ do |field|
    attach_file(field, File.join(Rails.root, "public/images/post_default.png"))
end

When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

Then /"(.*)" should contain option "(.*)"/ do |dropdown, option|
  Rails.logger.debug page.body
  expect(page).to have_select(dropdown, :with_options => [option])
end

Then /"(.*)" should not contain option "(.*)"/ do |dropdown, option|
  expect(page).not_to have_select(dropdown, :with_options => [option])
end

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





