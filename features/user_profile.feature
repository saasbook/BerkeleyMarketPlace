Feature: view and edit user profile

  As a user,
  I want to see my profile
  I can edit and see my profile in user dashboard
  
  
Background:
  Given I am on the home page
  Then I login with correct normal email
  Given there is an item
  
Scenario: direct to user profile page
  Given I am on the home page
  When I press "Test User"
  Then I should be on the user page
  Then I should see "cucumber.test@berkeley.edu"

Scenario: upload profile image
  Given I am on the user page
  Then I attach the file to "Profile Image"
  When I press "Save"

Scenario: check my posts
  Given I am on the user page
  Then I press "My Post"
  Then I should be on the my post page
  Then I should see all my posts
  And I should see "Edit" under each post
  And I should see "Set unavailable"
