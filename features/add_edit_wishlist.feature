Feature: Add post to wishlist

    AS a buyer,
    I want to add specific post to my wishlist,
    SO THAT I can click the "Add to wishlist" button in detail page and see that post in my user profile under 'My wishlist' section.


Background:
  Given I am on the home page
  Then I login with correct normal email


Scenario: can add a post to wishlist and see it under my wishlist
  Given I am on the home page
  When I find one of "Concert tickets in SF"
  And I press "Add to wishlist"
  And I go to the user page
  And I press "My Wishlist"
  Then I should see "Concert tickets in SF"

Scenario: can remove a post from wishlist
  Given I am on the home page
  When I find one of "iClicker"
  And I press "Add to wishlist"
  And I go to the user page
  And I press "My Wishlist"
  Then I should see "iClicker"
  When I press "Remove" for the post contains "iClicker"
  Then I should not see "iClicker"