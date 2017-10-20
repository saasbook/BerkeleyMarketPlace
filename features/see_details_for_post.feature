@detail
Feature: buyer can see the detail of a post
 
  As a buyer,
  I want to see the detail of a product,
  I can click one post and enter the detail page of the product.
  
Background: posts in database
 
  Given the following posts exist:
  | title                 | release_time | price | description       | available | author_id | expire_time | category | subcategory |
  | iPhone 7 for sale     | 2017-10-14   | 500   | In good condition | true      | 1         |             | item     | cell_phone  |
  | concert ticket        | 2017-10-14   | 50    |                   | true      | 1         | 2017-12-31  | event    |             |
  | CS research assistant | 2017-9-8     | 0     |                   | false     | 1         | 2017-10-1   | job      |             |
  | graphic designer      | 2017-9-9     | 0     |                   | true      | 1         | 2018-10-2   | job      |             |

  
Scenario: go from home page to Detail page for one post
    Given I am on the home page
    When I follow "iPhone 7 for sale"
    Then I should be on the details page for "iPhone 7 for sale"
    And I should see "iPhone 7 for sale"
    And I should see "2017-10-14"
    And I should see "500"
    And I should see "In good condition"
    And I should see "item"
    And I should see "cell_phone"
    
Scenario: go from home page to Detail page for one post
    Given I am on the home page
    When I follow "graphic designer"
    Then I should be on the details page for "graphic designer"
    And I should see "graphic designer"
    And I should see "0 "
    And I should see "job"