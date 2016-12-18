Feature: Access to employers resource and searching employers
  Method get emploeyrs should respond with a list of areas
  Parameters can be additionally sent to perform a more specific search

  Scenario Outline: Search with parameters
    Given I send a GET request to employers resource with area <area> and text <name>
    Then http status of the response should be 200
    Then the length of found items array should equal to the "found" value 
    And the response should contain 1 item
    And the name of item should be like <name>
  Examples: 
    | area    | name |
    | 113  | Новые облачные технологии     |
    | 113  | Новые Облачные Технологии     |
    | 113  | Новые   Облачные   Технологии     |
    | | Новые облачные технологии     |
