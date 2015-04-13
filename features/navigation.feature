Feature: viewing and navigating around Hamper
  Scenario: viewing the home page
    Given there are some conventions
    When I navigate to the home page
    Then I should see a list of the conventions
