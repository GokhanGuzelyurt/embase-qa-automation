Feature:Standardize searching of dates in Embase

  Background: Home page
    Given user opens Embase application
    Then Quick search page is opened
    When user opens Results page

  @C563061
  Scenario Outline: Verify date results when date format change
    And user enters actual query <actual_date> and performs a search
    And user enters expected query <expected_date> and performs a search
    Then the results are the same when the date format is changed
    Examples:
      | actual_date                       | expected_date                    |
      | '[2019-01-01 to 2021-02-02]':pd   |'[01-01-2019 to 02-02-2019]':pd   |
      |  [10-10-2015 to 02-02-2022]/aip   | [2015-10-10 to 2022-02-02]/aip   |
      |  2016/aip                         | 2016/aip                         |
      |  '10-2016'/aip                    | '2016-10'/aip                    |
      |  '10-2020':dc                     | '2020-10':dc                     |
      |  '2020-10':ld                     | '10-2020':ld                     |




