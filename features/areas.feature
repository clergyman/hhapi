Feature: Getting areas list
  Method get areas should respond with a list of areas

Scenario: Get Areas
  When I send a GET request
  Then I should get the list of areas
