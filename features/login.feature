Feature: login and authentication 

  As a user,
  I want to login using bmail
  I can pass authentication 
  
Scenario: login page to authentication page
  Given I am on the login page
  When I press "Login"
  Then I should be on the authentication page
  

Scenario: authentication page to home page
  Given I am on the authentication page
  When I fill in "Email" with "testuser@berkeley.edu" 
  When I press "Certified"
  Then I should be on the home page

