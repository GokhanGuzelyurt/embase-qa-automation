@ID+ @login
Feature: ID+ login tests

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened
    And user clicks on Sign In button
    Given user enters email id as test31220185249@test.test and click Continue

#  @C392040
#  Scenario: Verify Login page contents
#    Then Login page UI elements are displayed

  @C392041
  Scenario: Verify that a warning message is displayed when password is entered incorrectly
    And user tries to login with password abcdef
    Then an error message Password incorrect. Try again or click forgot password. is displayed

#  @C392042
#  Scenario: Verify that the email text box is disabled
#    Then user verifies that email text box is disabled
#
#  @C392043
#  Scenario: Verify forgotten password link UI elements
#    And user clicks on Forgotten Password link
#    And user verifies Forgotten password link UI elements
#
#  @C392044
#  Scenario:Verify that clicking on Go back to Sign in on forgotten password page redirects us to Login page
#    And user clicks on Forgotten Password link
#    And user click on Go back to sign in button
#    Then Login page UI elements are displayed
#
#  @C392045
#  Scenario: Verify that Sign in with a different account allows user to enter a new email
#    And user click on Sign in with a different account button
#    Then verify that user email field is displayed
#    Then user enters email id as embase_limited@elsevier.com and click Continue
#    Then Login page UI elements are displayed
#    And the disabled email value on login page is embase_limited@elsevier.com
#    And user enters password as embase_limited@elsevier.com1 and click SignIn
#    Then Quick search page is opened







