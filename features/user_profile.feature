Feature: view and edit user profile

  As a user,
  I want to see my profile
  I can edit and see my profile in user dashboard
  
Scenario: direct to user profile page
  Given I am on the home page
  When I press "Account"
  Then I should be on the user page
  Then I should see "testuser@berkeley.edu" in the field "Email"

Scenario: upload profile image
  Given I am on the user page
  Then I upload image
  When I press "Save"
  Then I should see image in the field "Photo"

Scenario: check my posts
  Given I am on the user page
  Then I press "My Posts"
  Then I should be on the my posts page
  Then I should see all my posts
  And I should see "Edit" under each post
