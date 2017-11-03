Given /the following posts exist/ do |post_table|
  post_table.hashes.each do |post|
    Post.create post
  end
end

When /I find one of "(.*)"/ do |name|
  first(:link, name).click
end

When /I login with correct normal email/ do
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    "provider" => "google_oauth2",
    "uid" => "-999",
    "info" => {
      "name" => "Test User",
      "email" => "marketplace.test@berkeley.edu",
    },
    "credentials" => {
      "token" => "TEST_TOKEN",
      "refresh_token" => "TEST_REFRESH_TOKEN",
      "expires_at" => 32503680000, # 3000/1/1
      "expires" => true
    }
  })
  click_on("Login")
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
  click_on("Login")
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
  click_on("Login")
end


When /I logout/ do
  click_on("Logout")
  OmniAuth.config.mock_auth[:google_oauth2] = nil
end

# Then /I should see "(.*)"/ do |item_name|
#   page.should have_content(item_name)
# end

# Then /I should see "(.*)" but not "(.*)"/ do |item_name, not_exist|
#   page.should have_content(item_name) and page.should have_no_content(not_exist)
# end