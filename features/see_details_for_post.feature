@detail
Feature: buyer can see the detail of a post
 
  As a buyer,
  I want to see the detail of a product,
  I can click one post and enter the detail page of the product.
  
Background: posts in database
 
  Given the following posts exist:
  | title                 | release_time | price | description       | available | author_id | expiration_time | category | subcategory | image     |
  | iPhone 7 for sale     | 2017-10-14   | 500   | In good condition | true      | 1         |                 | item     | cell_phone  | img1.jpeg |
  | concert ticket        | 2017-10-14   | 50    |                   | true      | 1         | 2017-12-31      | event    |             | img2.jpeg |
  | CS research assistant | 2017-9-8     | 0     |                   | false     | 1         | 2017-10-1       | job      |             | img3.jpeg |
  | graphic designer      | 2017-9-9     | 0     |                   | true      | 1         | 2017-10-2       | job      |             | img4.jpeg |
  
Scenario: go from home page to Detail page for one post
    Given I am on the Home page
    When I follow "iPhone 7 for sale"
    Then I should be on the Details page for "iPhone 7 for sale"
    And I should see the following on the Details page for "iPhone 7 for sale": "iPhone 7 for sale" , "2017-10-14", "500", "In good condition", "available","item", "cell_phone", 
    And I should not see the following on the Details page for "iPhone 7 for sale": "CS research assistant", "graphic designer"