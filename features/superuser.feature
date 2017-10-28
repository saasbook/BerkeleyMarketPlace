Feature: login and authentication 

  As a superuser,
  I want to manage all people's posts
  I can delete any post I want
  
Scenario: prove login as a superuser
  Given I am on the login page
  When I logged in 
  Then I should see 'Admin' button in header
  

Scenario: delete users' posts in details page
  Given I am on the details page of 'iClicker'
  Then I can see a 'Delete' button on the page
  When I click the 'Delete' button
  Then The post does not exist in the app

