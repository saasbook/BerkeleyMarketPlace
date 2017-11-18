# id 151972815
Feature: create a new post
 
  As a seller
  So that I can sell my product
  I want to describe my product and post it to the website
  
  
Background:
  Given I am on the home page
  Then I login with correct normal email
  # this is a hack, not sure why but needs to have at least a post
  Given there is an item
  
 
Scenario: direct to create new post with setted email
  When I go to the create page
  Then I should see "Post Something"
  Then I should see "cucumber.test@berkeley.edu" in the field "Email"

  
Scenario: select a category updates subcategory selections correctly
  When I go to the create page
  Then "post_subcategory" should contain option "please select a category first"
  And "post_subcategory" should not contain option "book"
  
  Then I select "item" from "Category"
  Then "post_subcategory" should not contain option "please select a category first"
  And "post_subcategory" should contain option "book"
  
  Then I select "event" from "Category"
  Then "post_subcategory" should not contain option "please select a category first"
  And "post_subcategory" should contain option "performance"
  
  Then I select "- Select -" from "Category"
  Then "post_subcategory" should contain option "please select a category first"
  And "post_subcategory" should not contain option "book"
  And "post_subcategory" should not contain option "performance"

Scenario: create a post
  Given I am on the create page
  Then I attach the file to "Image"
  And I fill in "Title" with "Jack Ye"
  And I fill in "Price" with "1"
  And I fill in "Description" with "In good quality"
  When I select "item" from "Category"
  Then I select "book" from "Subcategory"
  When I press "Create Post"
  Then I should be on the details page for "Jack Ye"
  
Scenario: didn't upload image - sad path
  Given I am on the create page
  And I fill in "Title" with "Doggy Huang1"
  And I fill in "Price" with "0"
  And I fill in "Description" with "In bad quality"
  And I select "item" from "Category"
  Then I select "book" from "Subcategory"
  When I press "Create Post"
  Then I should be on the create page

Scenario: didn't enter number for prices - sad path
  Given I am on the create page
  Then I attach the file to "Image"
  And I fill in "Title" with "Doggy Huang2"
  And I fill in "Price" with "aha"
  And I fill in "Description" with "In bad quality"
  And I select "item" from "Category"
  Then I select "book" from "Subcategory"
  When I press "Create Post"
  Then I should be on the create page