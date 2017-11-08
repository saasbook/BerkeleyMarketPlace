Feature: edit my post

    AS a seller
    SO THAT I can click edit button for each post in 'My posts' section on the user page
    I want to edit a existed post that I posted
  
Background:
  Given I am on the home page
  Then I login with correct normal email

Scenario: direct to edit page
  Given I create a test post
  Then I go to the user page
  Then I press "My Post"
  Then I should see the test post
  When I press "Edit" for the test post
  Then I should be on the edit post page for test post

Scenario: edit my posts
  Given I am on the edit post page for test post
  Then I should see "Jack Ye" in the field "Title"
  And I fill in "Title" with "Yunyi Huang"
  When I press "Save Post"
  Then I should be on the details page
  And I should see "Yunyi Huang" in the field "Title"
  And I should not see "Jack Ye" in the field "Title"

Scenario: mark my posts as unavailable
  Given I create a test post
  And I go to the user page
  And I press "My Post"
  Then I should see the test post
  When I press "Set unavailable" for the test post
  And I press the test post
  Then I should see "Unavailable"