Feature: buyer can see the detail of a post
 
  As a buyer,
  I want to see the detail of a product,
  I can click one post and enter the detail page of the product.
  
Background:
  Given I am on the home page
  Then I login with correct normal email
  
Scenario: go from home page to Detail page for one item
    Given I am on the home page
    # Then I follow "item"
    When I find one of "iClicker"
    Then I should see "iClicker"
    And I should see "item"
    And I should see "electronics"
    
Scenario: go from home page to Detail page for one job
    Given I am on the home page
    # Then I follow "job"
    When I find one of "machine learning expert"
    Then I should see "machine learning expert"
    And I should see "job"
    And I should see "computer science"
    
    
Scenario: go from home page to Detail page for one event
    Given I am on the home page
    # Then I follow "event"
    When I find one of "Concert tickets in SF"
    Then I should see "Concert tickets in SF"
    And I should see "event"
    And I should see "performance"