Feature: User want to login to his account

  Scenario: Login with valid email and password
    When I login with valid email and password
    Then I visit to home page

  Scenario: Login with invalid email
    When I login with invalid email
    Then I should be see an error message "Invalid email"

  Scenario: Login with invalid password
    When I login with invalid password
    Then I should be see an error message "Invalid email or password."