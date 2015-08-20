Feature: viewing and navigating around Hamper
  Scenario: viewing the home page
    Given there is a convention
    And I am logged in
    When I navigate to the home page
    Then I should see a list of the conventions
