package utils.testrail;


import com.google.gson.Gson;
import org.json.simple.JSONObject;
import utils.TestRailIntegration;
import utils.testrail.entities.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class TestRailHelper {


    // get latest result id from run-case
    // https://www.gurock.com/testrail/docs/api/reference/results#getresultsforcase
    // GET index.php?/api/v2/get_results_for_case/:run_id/:case_id

    public static ArrayList<Section> getSections() {
        ArrayList<Section> results = new ArrayList<>();
        APIClient client = new APIClient(TestRailIntegration.TESTRAIL_URI);
        client.setUser(TestRailIntegration.TESTRAIL_USERNAME);
        client.setPassword(TestRailIntegration.TESTRAIL_APIKEY);

        try {
            // getting Sections
            Gson gson = new Gson();
            results = gson.fromJson(client.sendGet("get_sections/"
                    + TestRailIntegration.PROJECT_ID + "&suite_id="
                    + TestRailIntegration.SUITE_ID).toString(), PaginatedResponse.class).getSections();
        } catch (IOException | APIException e) {
            e.printStackTrace();
        }
        return results;
    }

    public static ArrayList<Case> getCases() {
        ArrayList<Case> results = new ArrayList<>();
        APIClient client = new APIClient(TestRailIntegration.TESTRAIL_URI);
        client.setUser(TestRailIntegration.TESTRAIL_USERNAME);
        client.setPassword(TestRailIntegration.TESTRAIL_APIKEY);
        String nextPageString = "";

        try {
            // getting Cases
            while (true) {
                Gson gson = new Gson();
                PaginatedResponse paginatedResponse = gson.fromJson(client.sendGet("get_cases/"
                        + TestRailIntegration.PROJECT_ID + "&suite_id="
                        + TestRailIntegration.SUITE_ID + nextPageString).toString(), PaginatedResponse.class);
                results.addAll(paginatedResponse.getCases());
                if (paginatedResponse.get_links().getNext() == null) {
                    break;
                } else {
                    nextPageString = paginatedResponse.get_links().getNext();
                    nextPageString = nextPageString.substring(18 +
                            (TestRailIntegration.PROJECT_ID + "").length() + 10 +
                            (TestRailIntegration.SUITE_ID + "").length());
                }
            }
        } catch (IOException | APIException e) {
            e.printStackTrace();
        }
        return results;
    }

    public static ArrayList<Test> getTestsInRun(int runId) {
        ArrayList<Test> results = new ArrayList<>();
        APIClient client = new APIClient(TestRailIntegration.TESTRAIL_URI);
        client.setUser(TestRailIntegration.TESTRAIL_USERNAME);
        client.setPassword(TestRailIntegration.TESTRAIL_APIKEY);

        try {
            // getting Tests
            Gson gson = new Gson();
            results = gson.fromJson(client.sendGet("get_tests/" + runId).toString(), PaginatedResponse.class).getTests();
        } catch (IOException | APIException e) {
            e.printStackTrace();
        }
        return results;
    }


    public static int getLatestResultID(int runId, int caseId) {
        int resultId = 0;

        APIClient client = new APIClient(TestRailIntegration.TESTRAIL_URI);
        client.setUser(TestRailIntegration.TESTRAIL_USERNAME);
        client.setPassword(TestRailIntegration.TESTRAIL_APIKEY);

        ArrayList<Result> results = new ArrayList<Result>();
        try {
            // getting latest Results for the CaseId (in the Run)
            Gson gson = new Gson();
            results = gson.fromJson(client.sendGet("get_results_for_case/" + runId + "/" + caseId).toString(), PaginatedResponse.class).getResults();
            // getting 1st element from array (latest reported Result)
            Result firstResult = results.get(0);
            // getting ID of the Result
            resultId = firstResult.getId();
        } catch (IOException | APIException e) {
            e.printStackTrace();
        }
        return resultId;
    }


    //add result
    public static void addResultForCase(Result result) {
        APIClient client = new APIClient(TestRailIntegration.TESTRAIL_URI);
        client.setUser(TestRailIntegration.TESTRAIL_USERNAME);
        client.setPassword(TestRailIntegration.TESTRAIL_APIKEY);

        Map data = new HashMap();
        data.put("status_id", result.getStatusId());
        data.put("comment", result.getComment());
//        data.put("elapsed", result.getElapsed());

        try {
            JSONObject r = (JSONObject) client.sendPost("add_result_for_case/" + TestRailIntegration.RUN_ID
                    + "/" + result.getCaseId(), data);
        } catch (IOException | APIException e) {
            e.printStackTrace();
        }
    }


    //add attachment to result id
    // https://www.gurock.com/testrail/docs/api/reference/attachments#addattachmenttoresult
    // POST index.php?/api/v2/add_attachment_to_result/:result_id

    public static void attachScreenshotToResult(Screenshot screenshot, int resultId) {

        APIClient client = new APIClient(TestRailIntegration.TESTRAIL_URI);
        client.setUser(TestRailIntegration.TESTRAIL_USERNAME);
        client.setPassword(TestRailIntegration.TESTRAIL_APIKEY);

        try {
            JSONObject response = (JSONObject) client.sendPost("add_attachment_to_result/" + resultId,
                    screenshot.getFileName());
        } catch (IOException | APIException e) {
            e.printStackTrace();
        }
    }

}
