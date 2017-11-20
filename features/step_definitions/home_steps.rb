Given /the following posts exist/ do |post_table|
  post_table.hashes.each do |post|
    Post.create post
  end
end

Then /I switch category to "(.*)"/ do |name|
  first(:link, name).click
end

When /find a post with title "(.*)"/ do |name|
  Rails.logger.debug page.body
  first(:link, name).click
end

When /I login with correct normal email/ do
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    "provider" => "google_oauth2",
    "uid" => "-999",
    "info" => {
      "name" => "Test User",
      "email" => "cucumber.test@berkeley.edu",
    },
    "credentials" => {
      "token" => "TEST_TOKEN",
      "refresh_token" => "TEST_REFRESH_TOKEN",
      "expires_at" => 32503680000, # 3000/1/1
      "expires" => true
    }
  })
  click_link("Login")
end

When /I login with correct superuser email/ do
  superuser_email = User.superusers.sample
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    "provider" => "google_oauth2",
    "uid" => "-999",
    "info" => {
      "name" => "Test User",
      "email" => superuser_email,
    },
    "credentials" => {
      "token" => "TEST_TOKEN",
      "refresh_token" => "TEST_REFRESH_TOKEN",
      "expires_at" => 32503680000, # 3000/1/1
      "expires" => true
    }
  })
  click_link("Login")
end

When /I login with incorrect email/ do
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    "provider" => "google_oauth2",
    "uid" => "-999",
    "info" => {
      "name" => "Test User",
      "email" => "marketplace.test@gmail.com",
    },
    "credentials" => {
      "token" => "TEST_TOKEN",
      "refresh_token" => "TEST_REFRESH_TOKEN",
      "expires_at" => 32503680000, # 3000/1/1
      "expires" => true
    }
  })
  click_link("Login")
end


When /I logout/ do
  find("a", text: "Logout").trigger("click")
  OmniAuth.config.mock_auth[:google_oauth2] = nil
end

When /I filter posts using "(.*)" by "(.*)"/ do |filter, option|
  select option, from: "filterrific[#{filter}]", visible: false
  sleep(1)
end


Then /I should see "(.*)" before "(.*)"/ do |text1, text2|
  idx1 = page.body.index(text1)
  idx2 = page.body.index(text2)
  expect(idx1).to be < idx2
  
end