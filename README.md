When all dependencies are set (npm install) we are ready to run BDD tests.

Steps to run BDD tests:

first of all let's download existing test cases from a created test plan / run in TestRail:

get test plan ID / run ID from TestRail
enter this / these value(s) in the corresponding field(s) in config.js, e.g. like in line below:
this.testRailPlanID = env.testPlanId ? env.testPlanId : '2315'
run or execute the command: npm run cucumber-testrail-sync
downloaded features are available in the folder: cypress/integration/features