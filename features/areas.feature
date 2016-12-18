Feature: Access to areas resource
  Method get areas should respond with a list of areas

Scenario: Get Areas List
  When I send a GET request to areas resource without parameters
  Then I should get valid list of areas
  And http status of the response should be 200
  
Scenario: Get Area By Id  
  When I send a GET request to areas resource with id 113
  Then I should get valid area details
  And http status of the response should be 200
