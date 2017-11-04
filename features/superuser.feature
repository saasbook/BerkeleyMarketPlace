Feature: login and authentication 

  As a superuser,
  I want to manage all people's posts
  I can delete any post I want
  
Scenario: normal user cannot access admin page
  When I go to the home page
  Then I login with correct normal email
  Then I should not see "Admin"
  Then I go to the admin page
  Then I should not see "Statistics"
  And I should see "not allowed to access"

Scenario: superuser can see admin page
  When I go to the home page
  Then I login with correct superuser email
  Then I should see "Admin"
  Then I go to the admin page
  Then I should see "Statistics"
  

Scenario: superuser can delete post
  When I go to the home page
  Then I login with correct superuser email
  Then I create a test post
  Then I press "Remove by Admin"
  Then I should see "removed from the database"
  
Scenario: normal user can delete post
  When I go to the home page
  Then I login with correct normal email
  Then I create a test post
  Then I should not see "Remove by Admin"

