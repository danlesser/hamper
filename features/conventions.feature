Feature: managing conventions
  Scenario: viewing a list of conventions
    Given there are some conventions
    When I go to the conventions page
    Then I should see a list of the conventions
