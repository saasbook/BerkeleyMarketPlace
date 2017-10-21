@detail
Feature: buyer can see the detail of a post
 
  As a buyer,
  I want to see the detail of a product,
  I can click one post and enter the detail page of the product.
  
  
Scenario: go from home page to Detail page for one item
    Given I am on the home page
    When I find one of "iClicker"
    And I should see "iClicker"
    And I should see "item"
    And I should see "electronics"
    
Scenario: go from home page to Detail page for one job
    Given I am on the home page
    When I find one of "machine learning expert"
    And I should see "machine learning expert"
    And I should see "job"
    And I should see "computer science"
    
    
Scenario: go from home page to Detail page for one event
    Given I am on the home page
    When I find one of "Concert ticket in SF"
    And I should see "Concert ticket in SF"
    And I should see "event"
    And I should see "performance"