Feature: search posts in search bar
  As a buyer,
  I want to find relevant items or events
  By searching keywords in search bar
  
Scenario: search for a substring of post titles in search bar 
  When I fill in "navBarSearchForm" with "iClicker"
  When I press "Go"
  Then I should see "iClicker for sale"
  And I should see "one iClicker"
  And I should see "used iClicker"
  And I should not see "Used Tesla"
  And I should see "CS189"
  
Scenario: search for a word that is not a substring of post titles, nor a category/subcategory key word
  When I fill in "navBarSearchForm" with "RANDOMSTRINGTHATDOESNTEXIST"
  When I press "Go"
  Then I should not see any posts

Scenario: search for an empty string
  When I fill in "navBarSearchForm" with ""
  When I press "Go"
  Then I should see all posts
  
Scenario: search category key words in search bar 
  When I fill in "navBarSearchForm" with " items"
  When I press "Go"
  Then I should see "iClicker for sale"
  And I should see "XBox"
  And I should see "used Tesla"
  And I should not see "career fair"
  And I should see "food hunt"
  
Scenario: search subcategory key words in search bar 
  When I fill in "navBarSearchForm" with " electronics"
  When I press "Go"
  Then I should see "iClicker for sale"
  And I should see "XBox"
  And I should see "used Tesla"
  And I should not see "Used King Bed"
  And I should see "CS189"
 
