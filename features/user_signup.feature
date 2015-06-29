Feature: Sign up
  In order to get access to protect session of this site
  I want to be able to sign up  

  Background: 
    Given I am not loged in

  Scenario: User sign up with valid data
    When I sign up with valid data 
    Then I should visit homepage

  Scenario: User sign up with mismatch password and password confirmation
    When I signup with mismatch password and password confirmation
    Then  I should be see a mismatch password "Password confirmation doesn't match Password"
