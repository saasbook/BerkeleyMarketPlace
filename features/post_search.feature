#id 152579982
# Feature: search posts in search bar
#   As a buyer,
#   I want to find relevant items or events
#   By searching keywords in search bar
  
# Background:
#   Given I am on the home page
#   Then I login with correct normal email
#   Given there is an item
#   Given there is an event
#   Given there is a job

# Scenario: search by title
#   Given I am on the home page
#   When I fill in "search_terms" with "item title"
#   When I press "Go"
#   Then I should see "sample item title"
#   #And I should not see "sample event title"
#   #And I should not see "sample job title"
  
# Scenario: search by description
#   Given I am on the home page
#   When I fill in "search_terms" with "item description"
#   When I press "Go"
#   Then I should see "sample item title"
#   #And I should not see "sample event title"
#   #And I should not see "sample job title"
  
  
# Scenario: search case insensitive
#   Given I am on the home page
#   When I fill in "search_terms" with "ITEM"
#   When I press "Go"
#   Then I should see "sample item title"
#   #And I should not see "sample event title"
#   #And I should not see "sample job title"
  
# Scenario: search subcategory
#   Given I am on the home page
#   When I fill in "search_terms" with "performance"
#   When I press "Go"
#   Then I should not see "sample item title"
#   #And I should see "sample event title"
#   #And I should not see "sample job title"