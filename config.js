let env = {
    testPlanId:  process.env.TESTPLAN_ID,            // Test Plan ID from TestRail
    testRunId:   process.env.TESTRUN_ID,             // Test Run ID from TestRail
    testCaseIds: process.env.TESTCASE_IDS,           // Test Case IDs from TestRail to be run only (set it to 'not @tcid:remove_not' to be ignored)
}

let Config = function () {
    this.testRailURL = 'elss.testrail.net'
    this.testRailUser = 'd.bruno@elsevier.com'
    this.testRailPass = '7a.R.YBhaGnBGHzVofdv-InUnwZzZgAx9Z6AAZoNb'
    this.testRailPlanID  = env.testPlanId      ? env.testPlanId      : '2650'
    this.testRailRunID   = env.testRunId       ? env.testRunId       : '-'
    this.testRailCaseIDs = env.testCaseIds     ? env.testCaseIds     : 'not @tcid:remove_not'
    this.testRailRunID    = this.testRailRunID    === '-'    ? undefined : this.testRailRunID
    this.testRailReport = true
}

module.exports = new Config()