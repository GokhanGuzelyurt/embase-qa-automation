package utils.testrail;


import com.google.gson.Gson;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import utils.TestRailIntegration;
import utils.testrail.entities.*;

import java.io.IOException;
import java.util.ArrayList;

public class TestRailHelper {


    // get latest result id from run-case
    // https://www.gurock.com/testrail/docs/api/reference/results#getresultsforcase
    // GET index.php?/api/v2/get_results_for_case/:run_id/:case_id

    public static ArrayList<Section> getSections() {
        ArrayList<Section> results = new ArrayList<>();
        APIClient client = new APIClient(TestRailIntegration.testRailUri);
        client.setUser(TestRailIntegration.testRailUserName);
        client.setPassword(TestRailIntegration.testRailApiKey);

        try {
            // getting Sections
            Gson gson = new Gson();
            results = gson.fromJson(client.sendGet("get_sections/" + TestRailIntegration.projectID + "&suite_id=" + TestRailIntegration.suiteId).toString(), Sections.class);

        } catch (IOException | APIException e) {
            e.printStackTrace();
        }
        return results;
    }

    public static ArrayList<Case> getCases() {
        ArrayList<Case> results = new ArrayList<>();
        APIClient client = new APIClient(TestRailIntegration.testRailUri);
        client.setUser(TestRailIntegration.testRailUserName);
        client.setPassword(TestRailIntegration.testRailApiKey);

        try {
            // getting Cases
            Gson gson = new Gson();
            results = gson.fromJson(client.sendGet("get_cases/" + TestRailIntegration.projectID + "&suite_id=" + TestRailIntegration.suiteId).toString(), Cases.class);
        } catch (IOException | APIException e) {
            e.printStackTrace();
        }
        return results;
    }

    public static ArrayList<Test> getTestsInRun(int runId) {
        ArrayList<Test> results = new ArrayList<>();
        APIClient client = new APIClient(TestRailIntegration.testRailUri);
        client.setUser(TestRailIntegration.testRailUserName);
        client.setPassword(TestRailIntegration.testRailApiKey);

        try {
            // getting Tests
            Gson gson = new Gson();
            results = gson.fromJson(client.sendGet("get_tests/" + runId).toString(), Tests.class);
        } catch (IOException | APIException e) {
            e.printStackTrace();
        }
        return results;
    }


    public static int getLatestResultID(int runId, int caseId) {
        int resultId = 0;

        APIClient client = new APIClient(TestRailIntegration.testRailUri);
        client.setUser(TestRailIntegration.testRailUserName);
        client.setPassword(TestRailIntegration.testRailApiKey);

        JSONArray responseJsonResultsArray = null;
        try {
            // getting latest Results for the CaseId (in the Run)
            responseJsonResultsArray = (JSONArray) client.sendGet("get_results_for_case/" + runId + "/" + caseId);

            // getting 1st element from array (latest reported Result)
            JSONObject firstResult = (JSONObject) responseJsonResultsArray.get(0);

            // getting ID of the Result
            resultId = Integer.parseInt(firstResult.get("id").toString());

        } catch (IOException | APIException e) {
            e.printStackTrace();
        }
        return resultId;
    }


    //add attachment to result id
    // https://www.gurock.com/testrail/docs/api/reference/attachments#addattachmenttoresult
    // POST index.php?/api/v2/add_attachment_to_result/:result_id

//    public static void attachScreenshotToResult(Screenshot screenshot, int resultId) {
//
//        APIClient client = new APIClient(TestRailIntegration.testRailUri);
//        client.setUser(TestRailIntegration.testRailUserName);
//        client.setPassword(TestRailIntegration.testRailApiKey);
//
//        try {
//            JSONObject response = (JSONObject) client.sendPost("add_attachment_to_result/" + resultId,
//                    screenshot.getFileName());
//        } catch (IOException | APIException e) {
//            e.printStackTrace();
//        }
//    }

}
