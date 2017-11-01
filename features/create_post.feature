Feature: create a new post
 
  As a seller
  So that I can sell my product
  I want to describe my product and post it to the website
 
 
Scenario: direct to create new post with setted email
  Given I am on the home page
  When I follow "Post Now!"
  Then I should be on the create page
  Then I should see "seed-user1@berkeley.edu" in the field "Email"

Scenario: create a post
  Given I am on the create page
  Then I attach the file to "Image"
  And I fill in "Title" with "Jack Ye"
  And I fill in "Price" with "1"
  And I fill in "Description" with "In good quality"
  When I select "item" from "Category"
  # And I wait 1 seconds
  # Then I select "book" from subcategory
  Then I select "please select subcategory" from "Subcategory"
  When I press "Create Post"
  Then I should be on the details page for "Jack Ye"
  
  
Scenario: didn't upload image - sad path
  Given I am on the create page
  And I fill in "Title" with "Doggy Huang1"
  And I fill in "Price" with "0"
  And I fill in "Description" with "In bad quality"
  And I select "item" from "Category"
  # And I wait 10 seconds
  # Then I select "book" from "Subcategory"
  Then I select "please select subcategory" from "Subcategory"
  When I press "Create Post"
  Then I should see "Please upload an image"

Scenario: didn't emter number for prices - sad path
  Given I am on the create page
  Then I attach the file to "Image"
  And I fill in "Title" with "Doggy Huang2"
  And I fill in "Price" with "aha"
  And I fill in "Description" with "In bad quality"
  And I select "item" from "Category"
  # And I wait 10 seconds
  # Then I select "book" from "Subcategory"
  Then I select "please select subcategory" from "Subcategory"
  When I press "Create Post"
  Then I should see "Please enter a valid price."