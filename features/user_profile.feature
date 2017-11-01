Feature: view and edit user profile

  As a user,
  I want to see my profile
  I can edit and see my profile in user dashboard
  
Scenario: direct to user profile page
  Given I am on the home page
  When I press "seed-user 1"
  Then I should be on the user page
  Then I should see "seed-user1@berkeley.edu"

Scenario: upload profile image
  Given I am on the user page
  Then I attach the file to "Profile Image"
  When I press "Save"
  # Then I should have image in the field "Profile Image"

Scenario: check my posts
  Given I am on the user page
  Then I press "My Post"
  Then I should be on the my post page
  Then I should see all my posts
  And I should see "Edit" under each post
