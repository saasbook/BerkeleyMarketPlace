Feature: see posts on homepage
 
  As a buyer,
  I want to see all the posts.
  I can see all the posts on the homepage.
  
Background: posts in database
 
  Given the following posts exist:
  | title                 | release_time | price | description       | available | author_id | expire_time | category | subcategory |
  | iPhone 7 for sale     | 2017-10-14   | 500   | In good condition | true      | 1         |             | item     | cell_phone  |
  | concert ticket        | 2017-10-14   | 50    |                   | true      | 1         | 2017-12-31  | event    |             |
  | CS research assistant | 2017-9-8     | 0     |                   | false     | 1         | 2017-10-1   | job      |             |
  | graphic designer      | 2017-9-9     | 0     |                   | true      | 1         | 2018-10-2   | job      |             |

Scenario: see product posts on the Home page with price
  When I go to the home page
  Then I should see "iPhone 7 for sale"
  And I should see "500"
 
Scenario: see event posts on the Home page
  When I go to the home page
  Then I should see "concert ticket"
 
Scenario: see job posts on the Home page
  When I go to the home page
  Then I should see "graphic designer"
  
Scenario: not see filtered posts on home page
  When I go to the home page
  Then I follow "job"
  And I should see "graphic designer"
  And I should not see "concert ticket"
  
Scenario: not see unavailable posts on the home page
  When I go to the home page
  Then I should not see "CS research assistant"
  