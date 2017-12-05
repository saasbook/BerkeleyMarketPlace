# id 152579705
Feature: add delete admin
  AS a admin,
  I want to add more admins or delete inactive admins,
  So That I can manage the user authorities in the admin board

Scenario: add a valid admin
  When I go to the home page
  Then I login with correct superuser email
  Given there is an item
  Then I go to the admin page
  And I fill in "Email" with "marketplace.test@berkeley.edu"
  When I press "Add Admin"
  Then I should see "marketplace.test@berkeley.edu"
  Then I go to the admin page
  And I should see "DELETE"
  
Scenario: add an invalid admin
  When I go to the home page
  Then I login with correct superuser email
  Given there is an item
  Then I go to the admin page
  And I fill in "Email" with "marketplace.test@edu"
  When I press "Add Admin"
  Then I go to the admin page
  Then I should not see "marketplace.test@edu"

Scenario: delete a valid admin
  When I go to the home page
  Then I login with correct superuser email
  Given there is an item
  Then I go to the admin page
  And I fill in "Email" with "marketplace.test@berkeley.edu"
  When I press "Add Admin"
  Then I go to the admin page
  When I follow "delete"
  Then I go to the admin page
  Then I should not see "marketplace.test@berkeley.edu"

  
