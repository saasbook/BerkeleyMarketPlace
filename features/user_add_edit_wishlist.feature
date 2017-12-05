# id 152580012
Feature: Add post to wishlist

    AS a buyer,
    I want to add specific post to my wishlist,
    SO THAT I can click the "Add to wishlist" button in detail page and see that post in my user profile under 'My wishlist' section.


Background:
  Given I am on the home page
  Then I login with correct normal email


Scenario: can add a post to wishlist and see it under my wishlist
  Given there is an item
  Then I go to the home page
  #Given I am on the home page
  #When I find one of "Concert tickets in SF"
  When I find a post with title "sample item title"
  And I press "Add to Wishlist"
  And I go to the user page
  And I press "My Wishlist"
  Then I should see "sample item title"

Scenario: can remove a post from wishlist
  Given there is an item
  Then I go to the home page
  When I find a post with title "sample item title"
  And I press "Add to Wishlist"
  Then I should see "sample item title"
  Then I should see "REMOVE FROM WISHLIST"
  When I press "Remove from Wishlist"
  And I go to the user page
  And I press "My Wishlist"
  Then I should not see "sample item title"