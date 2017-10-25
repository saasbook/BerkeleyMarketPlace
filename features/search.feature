Feature: search posts in search bar
  As a buyer,
  I want to find relevant items or events by searching keywords in search bar
  
Scenario: search key words in search bar 
  When I fill in "navBarSearchForm" with "iClicker"
  Then I should see "iClicker for sale"
  And I should see "one iClicker"
  And I should see "used iClicker"
  And I should not see "Used Tesla"
  And I should see "CS189"
  
Scenario: search category key words in search bar 
  When I fill in "navBarSearchForm" with " items"
  Then I should see "iClicker for sale"
  And I should see "XBox"
  And I should see "used Tesla"
  And I should not see "career fair"
  And I should see "food hunt"
  
Scenario: search subcategory key words in search bar 
  When I fill in "navBarSearchForm" with " electronics"
  Then I should see "iClicker for sale"
  And I should see "XBox"
  And I should see "used Tesla"
  And I should not see "Used King Bed"
  And I should see "CS189"
 
  