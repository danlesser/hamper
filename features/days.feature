Feature: managing days

  Background:
    Given there is a convention
    And the convention has a day

  Scenario: Adding a day
    When I visit the convention details page
    And I click on the New Day button
    And I fill out the new day form
    And I click on the Create Day button
    Then I should see the day
