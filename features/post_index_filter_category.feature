#id 151972883
Feature: buyer can filter by category on homepage

  As a buyer,
  I want to see all posts of items,
  I can filter and see them on posts page.
  
Background:
  Given I am on the home page
  Then I login with correct normal email
  Given there is an item
  Given there is an event
  
Scenario: default to show all posts
  When I go to the posts page
  Then I should see "sample item"
  And I should see "sample event"
  
Scenario: select item category only gives items
  When I go to the posts page
  And I filter posts using "choose_category" by "Items"
  Then I should see "sample item"
  And I should not see "sample event"