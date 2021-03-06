Feature: managing events
  Background:
    Given there is a convention
    And the convention has a day
    And the convention has a room
    And the convention has a track
    And the convention has an event
    And the event belongs to the day, room and track
    And I am logged in

  Scenario: Viewing all of a convention's events
    When I visit the convention details page
    And I click on the All Events button
    Then I should see an outline of the event

  Scenario: Viewing a particular event's details
    When I visit the convention details page
    And I click on the All Events button
    And I click on the event
    Then I should see all the details of the event

  Scenario: Adding an event
    When I visit the convention details page
    And I click on the All Events button
    And I click on the New Event button
    And I fill out the event form
    And I click on the Create Event button
    Then I should see all the details of the new event

  Scenario: editing an event
    When I visit the convention details page
    And I click on the All Events button
    And I click on the event
    And I click on the Edit Event button
    And I fill out the event form
    And I click on the Update Event button
    Then I should see all the details of the new event

  @javascript
  Scenario: deleting a event
    When I visit the convention details page
    And I click on the All Events button
    And I click on the event
    And I click the Delete Event button and confirm
    Then the event should be removed
