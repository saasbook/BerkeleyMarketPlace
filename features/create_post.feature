Feature: create a new post
 
  As a seller
  So that I can sell my product
  I want to describe my product and post it to the website
 
 
Scenario: direct to create new post with setted email
  Given I am on the home page
  When I press "Create Post"
  Then I should be on the create page
  Then I should see "testuser@berkeley.edu" in the field "Email"

Scenario: create a post
  Given I am on the create page
  Then I upload image
  And I fill in "Title" with "Jack Ye"
  And I fill in "Price" with "1"
  And I fill in "Description" with "In good quality"
  And I select "Other" from "Catagory"
  When I press "Post"
  Then I should be on the details page for "Jack Ye"
  
  
Scenario: didn't upload image - sad path
  Given I am on the the create page
  And I fill in "Title" with "Doggy Huang"
  And I fill in "Price" with "0"
  And I fill in "Description" with "In bad quality"
  And I select "Other" from "Catagory"
  When I press "Post"
  Then I should see "Please Upload Image"