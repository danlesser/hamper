Feature: managing tracks

  Background:
    Given there is a convention
    And the convention has a track
    And I am logged in

  Scenario: Adding a track
    When I visit the convention details page
    And I click on the New Track button
    And I fill out the track form
    And I click on the Create Track button
    Then I should see the track

  Scenario: editing a track
    When I visit the convention details page
    And I click the Edit link for a track
    And I fill out the track form
    And I click on the Update Track button
    Then I should see the track

  @javascript
  Scenario: deleting a track
    When I visit the convention details page
    And I click the Delete link and confirm
    Then the track should be removed
