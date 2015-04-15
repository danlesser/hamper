Feature: managing days

  Background:
    Given there is a convention
    And the convention has a day

  Scenario: Adding a day
    When I visit the convention details page
    And I click on the New Day button
    And I fill out the day form
    And I click on the Create Day button
    Then I should see the day

  Scenario: editing a day
    When I visit the convention details page
    And I click the Edit link for a day
    And I fill out the day form
    And I click on the Update Day button
    Then I should see the day

  @javascript
  Scenario: deleting a day
    When I visit the convention details page
    And I click the Delete link and confirm
    Then the day should be removed
