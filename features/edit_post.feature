
Feature: edit my post

    AS a seller
    SO THAT I can click edit button for each post in 'My posts' section on the user page
    I want to edit a existed post that I posted
  
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

Scenario: direct to edit page
  Then I go to the user page
  Then I press "My Post"
  Then I should see "Jack Ye"
  When I press "EDIT" for my last post
  Then I should be on the edit page for "Jack Ye"

Scenario: edit my posts
  Given I am on the edit page for "Jack Ye"
  Then I should see "Jack Ye" in the field "Title"
  And I fill in "Title" with "Yunyi Huang"
  When I press "Update Post"
  #Then I should be on the details page
  And I should see "successfully updated"
  And I should see "Yunyi Huang"
  And I should not see "Jack Ye"

Scenario: mark my posts as unavailable
  Given I am on the user page
  And I press "My Post"
  Then I should see "Jack Ye"
  When I press "Mark as Sold" for my last post
  Then I should see "successfully marked as sold"
  Given I am on the user page
  And I press "My Post"
  Then I should see "Jack Ye"
  When I find a post with title "Jack Ye"
  Then I should see "Not available"