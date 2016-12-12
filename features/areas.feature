Feature: Getting areas list
  Method get areas should respond with a list of areas

Scenario: Get Areas List
  When I send a GET request to areas resource
  Then I should get valid list of areas
  
Scenario: Get Area By Id  
  When I send a GET request to areas resource with id 113
  Then I should get valid area details
