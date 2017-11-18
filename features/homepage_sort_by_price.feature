# id 152579776
Feature: buyer can sort by price on homepage
 
  As a buyer,
  I want to see cheapest posts,
  I can sort by price
  
Background:
  Given I am on the home page
  Then I login with correct normal email

Scenario: select oldest time first
  Given there is an item with the price "2333" and the title "item 1 title"
  Given there is an item with the price "0.23" and the title "item 2 title"
  When I go to the home page
  Then I filter posts using "sorted_by" by "price: lowest first"
  Then I should see "item 2 title" before "item 1 title"
  
Scenario: select latest time first
  Given there is an item with the price "0.23" and the title "item 1 title"
  Given there is an item with the price "2333" and the title "item 2 title"
  When I go to the home page
  Then I filter posts using "sorted_by" by "price: highest first"
  Then I should see "item 2 title" before "item 1 title"
  