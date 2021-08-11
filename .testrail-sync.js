require('./glob')

module.exports = {
    testrail: {
        host: 'https://' + config.testRailURL,
        user: config.testRailUser,
        password: config.testRailPass,  // password or api key
        filters: {
            plan_id: config.testRailPlanID,
            run_id: config.testRailRunID,
          //  run_id: process.env.TESTRAIL_RUN_ID ? process.env.TESTRAIL_RUN_ID : 0,  // optional: a test run
                         // if not set, all the runs in the plan will be included
            //customstatus: [3, 4] // optional list of whitelisted status (testcases that don't have 1 of thoses statuses won't be synced)
            // 3 = Approved
            // 4 = Approved to automate
        }
    },
    pushResults: false,
    featuresDir: 'src/test/resources/features/run',
    /* Optional: default testcase attributes when pushing new testcases to TestRail
    newTestCase: {
      section_id: 1,
      template_id: 1,
      type_id: 6,
      priority_id: 2,
      estimate: '0',
      custom_status: 4
    },
    */
    overwrite: {
        local: 'ask', // 'ask' will show you the differences and force you to confirm before overwriting
        remote: false
    },
    directoryStructure: {
        type: 'section:name'
    },
};