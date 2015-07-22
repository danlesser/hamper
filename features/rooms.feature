Feature: managing rooms

  Background:
    Given there is a convention
    And the convention has a room

  Scenario: Adding a room
    When I visit the convention details page
    And I click on the New Room button
    And I fill out the room form
    And I click on the Create Room button
    Then I should see the room

  Scenario: editing a room
    When I visit the convention details page
    And I click the Edit link for a room
    And I fill out the room form
    And I click on the Update Room button
    Then I should see the room

  @javascript
  Scenario: deleting a room
    When I visit the convention details page
    And I click the Delete link and confirm
    Then the room should be removed
