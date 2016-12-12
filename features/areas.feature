Feature: Getting areas list
  Method get areas should respond with a list of areas

Scenario: Get Areas
  When I send a GET request to areas resource
  Then I should get valid list of areas
