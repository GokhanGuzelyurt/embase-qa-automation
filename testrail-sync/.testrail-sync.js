let path = require('path')
let fs = require('fs')
// put files visible for actual test runner
let featuresDir        = path.join(__dirname, '..', 'src', 'test', 'resources', 'features', 'testrail-sync')
// keep step definitions folder inside the subproject not to mess with java code
let stepDefinitionsDir = path.join(__dirname, 'features', 'step_definitions')
fs.mkdirSync(featuresDir,        {recursive: true})
fs.mkdirSync(stepDefinitionsDir, {recursive: true})

module.exports = {
  featuresDir,
  stepDefinitionsDir,
  directoryStructure: {
    type: 'section:slug',
  },
  testrail: {
    host: 'https://elss.testrail.com',
    user: 'autotest@quosa.com',
    password: 'q0aHai6jAalmaixZibT7-w3mxw/QiQmzdO0ZwU2Iw',  // password or api key
    filters: {
      plan_id: '3696', // required: the project's plan id
      run_id: '3697',  // optional: a test run
                   // if not set, all the runs in the plan will be included
      // custom_status: [3, 4] // optional list of whitelisted status (testcases that don't have 1 of thoses statuses won't be synced)
                     // 3 = Approved
                     // 4 = Approved to automate
    }
  },
  gherkinFormatterOptions: {
    capitalizeStepsFirstChar: false,
  },
  /* Optional: default testcase attributes when pushing new testcases to TestRail
  newTestCase: {
    section_id: 1,
    template_id: 1,
    type_id: 6,
    priority_id: 2,
    estimate: '0',
    custom_status: 4
  }
  */
};
