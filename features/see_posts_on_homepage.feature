Feature: see posts on homepage
 
  As a buyer,
  I want to see all the posts.
  I can see all the posts on the homepage.
  
Background:
  Given I am on the home page
  Then I login with correct normal email
  
Scenario: see product posts on the Home page with price
  When I go to the home page
  Then I follow "all"
  Then I should see "iClicker"
 
Scenario: see filtered item posts on the Home page
  When I go to the home page
  Then I follow "item"
  And I should see "iClicker"
  And I should not see "machine learning expert"
  And I should not see "Concert tickets in SF"
 
Scenario: see filtered job posts on the Home page
  When I go to the home page
  Then I follow "job"
  And I should not see "iClicker"
  And I should see "machine learning expert"
  And I should not see "Concert tickets in SF"
  
Scenario: see filtered event posts on Home page
  When I go to the home page
  Then I follow "event"
  And I should not see "iClicker"
  And I should not see "machine learning expert"
  And I should see "Concert tickets in SF"
  
Scenario: not see unavailable posts on the Home page
  When I go to the home page
  Then I should not see "Asian life matters speech"
  