Feature: search posts in search bar
  As a buyer,
  I want to find relevant items or events
  By searching keywords in search bar
  
Background:
  Given I am on the home page
  Then I login with correct normal email
  
Scenario: search for case insensitive substrings of post titles in search bar 
  Given I am on the home page
  When I fill in "search_terms" with "iclicker"
  When I press "Go"
  Then I should see "iClicker"
  And I should not see "concert tickets"
  When I fill in "search_terms" with "xbox"
  When I press "Go"
  Then I should see "XBOX"
  
Scenario: search for a word that is not a substring of post titles, nor a category/subcategory key word
  Given I am on the home page
  When I fill in "search_terms" with "RANDOMSTRINGTHATDOESNTEXIST"
  When I press "Go"
  Then I should see "Found 0 Posts"
  Then I should not see any posts

Scenario: search for nothing and press Go
  Given I am on the home page
  When I press "Go"
  Then I should see "USD"

Scenario: search category key words in search bar 
  Given I am on the home page
  When I fill in "search_terms" with "item"
  When I press "Go"
  Then I should see "USD"
  
Scenario: search subcategory key words in search bar 
  Given I am on the home page
  When I fill in "search_terms" with "electronics"
  When I press "Go"
  Then I should see "USD"
  
  
