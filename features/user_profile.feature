Feature: view and edit user profile

  As a user,
  I want to see my profile
  I can edit and see my profile in user dashboard
  
  
Background:
  Given I am on the home page
  Then I login with correct normal email
  Given there is an item
  #When I create a test post
  Given I am on the create page
  Then I attach the file to "Image"
  And I fill in "Title" with "Jack Ye"
  And I fill in "Price" with "1"
  And I fill in "Description" with "In good quality"
  When I select "item" from "Category"
  Then I select "book" from "Subcategory"
  When I press "Create Post"
  Then I should be on the details page for "Jack Ye"
  
Scenario: direct to user profile page
  Given I am on the home page
  When I press "seed-user 1"
  Then I should be on the user page
  Then I should see "seed-user1@berkeley.edu"

Scenario: upload profile image
  Given I am on the user page
  Then I attach the file to "Profile Image"
  When I press "Save"
  Then I should have image in the field "Profile Image"

Scenario: check my posts
  Given I am on the user page
  Then I press "My Post"
  Then I should be on the my post page
  Then I should see "Jack Ye"
  And I should see button "EDIT"
  And I should see button "MARK AS SOLD"
