# id 151972913
Feature: see posts on homepage
 
  As a buyer,
  I want to see all the posts.
  I can see all the posts on the homepage.
  
Background:
  Given I am on the home page
  Then I login with correct normal email
  Given there is an item
  Given there is a sold_item
  
Scenario: not see unavailable posts on the Home page
  When I go to the home page
  Then I should see "sample item title"
  Then I should not see "sold item title"
  