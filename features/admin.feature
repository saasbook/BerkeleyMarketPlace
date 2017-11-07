Feature: add delete admin
  AS a admin,
  I want to add more admins or delete inactive admins,
  So That I can manage the user authorities in the admin board

Scenario: add a valid admin
  Given I am on the admin page
  When I press "Add Admin"
  Then I should be on the newadmin page
  And I fill in "Email" with "marketplace.test@berkeley.edu"
  When I press "Add"
  Then I should see "New admin is added to the system"
  
Scenario: add an invalid admin
  Given I am on the admin page
  When I press "Add Admin"
  Then I should be on the newadmin page
  And I fill in "Email" with "marketplace.test@edu"
  When I press "Add"
  Then I should see "Please fill in with a valid email"
  
Scenario: delete a valid admin
  Given I am on the admin page
  When I press "Delete Admin"
  Then I should be on the deleteadmin page
  And I fill in "Email" with "marketplace.test@berkeley.edu"
  When I press "Delete"
  Then I should see "marketplace.test@berkeley.edu is deleted from admin system"
  
Scenario: delete a nonexistent admin
  Given I am on the admin page
  When I press "Delete Admin"
  Then I should be on the deleteadmin page
  And I fill in "Email" with "marketplace@berkeley.edu"
  When I press "Delete"
  Then I should see "Admin not exists"
  
