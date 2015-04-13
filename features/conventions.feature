Feature: managing conventions
  Scenario: viewing a list of conventions
    Given there are some conventions
    When I visit the conventions page
    Then I should see a list of the conventions

  Scenario: adding a convention
    When I visit the conventions page
    And I click on the New Convention button
    And I fill out the convention form
    And I click on the Create Convention button
    Then I should see the convention
