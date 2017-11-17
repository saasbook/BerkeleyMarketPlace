
Feature: edit my post

    AS a seller
    SO THAT I can click edit button for each post in 'My posts' section on the user page
    I want to edit a existed post that I posted
  
Background:
  Given I am on the home page
  Then I login with correct normal email
  Given there is an item

Scenario: direct to edit page
  Then I go to the user page
  Then I press "My Post"
  Then I should see "sample item title"
  When I press "EDIT" for my last post
  Then I should be on the edit page for "sample item title"

Scenario: edit my posts
  Given I am on the edit page for "sample item title"
  Then I should see "sample item title" in the field "Title"
  And I fill in "Title" with "modified item title"
  When I press "Update Post"
  Then I should see "successfully updated"
  And I should see "modified item title"
  And I should not see "sample item title"

Scenario: mark my posts as unavailable
  Given I am on the user page
  And I press "My Post"
  Then I should see "sample item title"
  When I press "Mark as Sold" for my last post
  Then I should see "successfully marked as sold"
  Given I am on the user page
  And I press "My Post"
  Then I should see "sample item title"
  When I find a post with title "sample item title"
  Then I should see "Not available"