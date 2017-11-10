Feature: buyer can see the detail of a post
 
  As a buyer,
  I want to see the detail of a product,
  I can click one post and enter the detail page of the product.
  
Background:
  Given I am on the home page
  Then I login with correct normal email
  
Scenario: go from home page to Detail page for one item
  Given there is an item
  Then I go to the home page
  Then I should see "sample item"
  When I find a post with title "sample item title"
  Then I should see "sample item title"
  And I should see "sample item description"
  And I should see "book"
  And I should see "cucumber.test@berkeley.edu"