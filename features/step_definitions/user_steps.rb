Then /^I should have image in the field "(.*)"$/ do |field|
  variable=find("#imagePreview > img.img-fluid")
  @user = User.get_test_user
  variable['src'].should == @user.image.url.gsub('/original/', '/medium/')
  variable['alt'].should == "Responsive image"
end

Given /^I created a post with title "(.*)"$/ do |title|
    price = 1
    description = "In good quality"
    category = "item"
    subcategory = "please select subcategory"
    button = "Create Post"
    visit path_to("the create page")
    attach_file("Image", File.join(Rails.root, "public/images/post_default.png"))
    fill_in("Title", :with => title)
    fill_in("Price", :with => price)
    fill_in("Description", :with => description)
    select(category, :from => "Category")
    select(subcategory, :from => "Subcategory")
    click_on(button)
end

And /^(?:|I )should see button "([^"]*)"$/ do |button|
    # page.should have_button(button)
    should have_selector('a', text: button)
end