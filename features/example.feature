Feature: cucumber capybara example
  Background:
    Given Create eyes instance
    Then open eyes (app_name: "cucumber capybara example", test_name: "GitHub home page", viewport_size: "800x600")

  Scenario: GitHub home page (viewport screenshot)
    Given I visit "https://github.com"
    Then window should match a baseline

  Scenario: User input validation
    Given I visit "https://github.com"
    When I fill in by id "user[login]" field with "user"
    Then window should match a baseline

  Scenario: GitHub home page (full page screenshot)
    Given I visit "https://github.com"
    Then entire page should match a baseline

  Scenario: Check element
    Given I visit "https://github.com"
    Then element "" should match a baseline

  Scenario: Close eyes
    Then all tests should be successful
