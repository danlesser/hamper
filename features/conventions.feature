Feature: managing conventions
  Background:
    Given there is a convention

  Scenario: viewing a list of conventions
    When I visit the conventions page
    Then I should see a list of the conventions

  Scenario: adding a convention
    When I visit the conventions page
    And I click on the New Convention button
    And I fill out the convention form
    And I click on the Create Convention button
    Then I should see the convention

  Scenario: editing a convention
    When I visit the conventions page
    And I click the Edit link for a convention
    And I fill out the convention form
    And I click on the Update Convention button
    Then I should see the convention

  @javascript
  Scenario: deleting a convention
    When I visit the conventions page
    And I click the Delete link and confirm
    Then the convention should be removed

  Scenario: viewing the details of an individual convention
    Given the convention has a day
    And the convention has a track
    When I visit the conventions page
    And I click on a convention
    Then I should see the details of the convention
