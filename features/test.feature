@user @login
Feature: Login to the website
  In order to start using the site
  As an anonymous user
  I should be able to Login

  @javascript
  Scenario: View the Login page
    When I go to "/user/login"
    Then I should see "User account"
    And I should see the following <links>
      | links                    |
      | Log in                   |
      | Request new password     |

  @javascript
  Scenario Outline: Username validation: Valid username
    When I go to "/user/login"
    And I fill in "Username" with "<name>"
    And I fill in "Password" with random text
    And I press "Log in"
    Then I should see "Sorry, unrecognized username or password."
    And the field "Username" should be outlined in red
  Examples:
    | name       |
    | randomname |
    | 123453     |

  Scenario: Login as an admin and view user profile
    Given I am logged in as "admin" with the password "admin"
    And I go to "/user"
    Then I should see "admin"
    And I should see the following <links>
      | links        |
      | Edit         |
      | My items     |
      | Orders       |
      | Address Book |

  Scenario: Login as a sellerand view user profile
    Given I am logged in as "admin" with the password "admin"
    And I go to "/user"
    Then I should see "admin"
    And I should see the following <links>
      | links        |
      | My items     |
      | Orders       |
      | Address Book |
    And I should not see the following <links>
      | Edit         |