Feature: Access to vacancies resource and searching vacancies
  Method get vacancies should respond with a list of vacancies
  Parameters can be additionally sent to perform a more specific search

  Scenario Outline: Search with parameters
    Given I send a GET request to vacancies resource with area <area> and text <name> and employer_id <company>
    Then http status of the response should be 200
    And the response should contain at least 1 item
    And the name of item should be like <name>
  Examples: 
    | area    | name | company |
    | 2 | QA Automation Engineer | 213397 |
    | 2 | qa automation engineer | 213397 |
    | 2 | qa    automation    engineer    | 213397 |
    |  | qa automation engineer | 213397 |
    | 0 | qa automation engineer | 213397 |
    | 113 | QA Automation Engineer | 213397 |
