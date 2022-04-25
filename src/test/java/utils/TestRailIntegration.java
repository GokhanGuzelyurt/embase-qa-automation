package utils;

import cucumber.api.Scenario;
import org.apache.commons.io.FileUtils;
import org.apache.commons.text.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import utils.testrail.TestRailHelper;
import utils.testrail.entities.*;

import java.io.*;
import java.lang.invoke.MethodHandles;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collectors;


public class TestRailIntegration {

    private static Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    public static Properties properties = PropertiesReader.getProperties("src/test/resources/conf/testrail.properties");
    public static String TESTRAIL_URI = properties.getProperty("testRailUri");
    public static int PROJECT_ID = Integer.parseInt(properties.getProperty("projectId")); // Embase project
    public static int SUITE_ID = Integer.parseInt(properties.getProperty("suiteId"));
    public static String TESTRAIL_USERNAME = properties.getProperty("testRailUserName");
    public static String TESTRAIL_APIKEY = properties.getProperty("testRailApiKey");
    private static File runPath = Paths.get("src", "test", "resources", "features", "run").toFile();
    private static ArrayList<FeatureFile> featureFiles;
    public static boolean SEND_RESULTS_TESTRAIL = properties.getProperty("sendResultsToTestRail").equals("true");
    public static int RUN_ID = getRunId();


    public static void main(String[] args) throws IOException {
        logger.info("Get feature files from TestRail.");
        logger.info("TestRail Project ID: " + PROJECT_ID);
        logger.info("TestRail Suite ID:" + SUITE_ID);
        FileUtils.forceMkdir(runPath);
        FileUtils.cleanDirectory(runPath);
        getAllFeatureFiles();
        writeToFiles();
    }

    private static void getAllFeatureFiles() {

        // get all sections and put in featureFiles array
        featureFiles = new ArrayList<>();
        ArrayList<Section> sections = TestRailHelper.getSections();
        for (Section s : sections) {
            if (s.getName().contains(".feature"))
                featureFiles.add(new FeatureFile(s.getId(), s.getName(), s.getDescription()));
        }

        // get list of cases in TestRun if applicable
        ArrayList<Test> testsInRun = null;
        if (RUN_ID != 0) {
            logger.info("Getting cases from Test Run = " + RUN_ID);
            testsInRun = TestRailHelper.getTestsInRun(RUN_ID);
        }

        // get all cases and put the cases in the featureFiles array
        ArrayList<Case> cases = TestRailHelper.getCases();
        int scenarioCounter = 0;
        for (FeatureFile f : featureFiles) {
            for (Case c : cases) {
                if (c.getSection_id() == f.getSectionId()) {
                    if (RUN_ID != 0)
                        for (Test t : testsInRun) {
                            if (t.getCase_id() == c.getId()) {
                                f.getScenarios().add(new FeatureFileScenario(c.getId(), c.getTitle(), c.getCustom_preconds(), c.getCustom_steps()));
                                scenarioCounter++;
                            }
                        }
                    else {
                        f.getScenarios().add(new FeatureFileScenario(c.getId(), c.getTitle(), c.getCustom_preconds(), c.getCustom_steps()));
                        scenarioCounter++;
                    }
                }
            }
        }
        logger.info("Total amount of .feature files: " + featureFiles.size());
        logger.info("Total amount of Scenarios: " + scenarioCounter);
    }

    public static void writeToFiles() {
        // write each featureFile to a file
        for (FeatureFile f : featureFiles) {
            if (f.getScenarios().size() >= 1)
                try {
                    Writer out = new BufferedWriter(new OutputStreamWriter(
                            new FileOutputStream(Paths.get(runPath.getPath(), f.getName()).toFile()), "UTF-8"));
                    out.write(StringEscapeUtils.unescapeHtml4(f.toString()));
                    out.close();
                    logger.info(StringEscapeUtils.unescapeHtml4(f.toString()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }
    }


    public static int getCaseIdFromScenarioTags(Collection<String> sourceTagNames) {
        List<String> caseIds = sourceTagNames.stream().filter(t -> t.matches("@(?:C|tcid:)\\d+")).collect(Collectors.toList());
        return Integer.parseInt(caseIds.get(0).replaceAll("[^0-9]", ""));
    }

    public static void sendResult(Result result) {
        TestRailHelper.addResultForCase(result);
        if (result.getStatusId() != 1) {
            logger.info("Sending screenshot to Result");
            int latestResultId = TestRailHelper.getLatestResultID(RUN_ID, result.getCaseId());
            TestRailHelper.attachScreenshotToResult(result.getScreenshot(), latestResultId);
        }
    }

    private static int getRunId() {
        if (System.getenv("testRun") != null) {
            return Integer.parseInt(System.getenv("testRun"));
        }
        return Integer.parseInt(properties.getProperty("testRunId"));
    }

    public static String getScenarioDetails(Scenario scenario) {
        if (isScenarioOutline(scenario)) {
            return "Scenario Outline: " + scenario.getName() + "\nExample line:\n" + readExampleFromScenario(scenario);
        } else {
            return "Single Scenario: " + scenario.getName();
        }
    }

    private static boolean isScenarioOutline(Scenario scenario) {
        return scenario.getLines().size() > 1;
    }

    private static String readExampleFromScenario(Scenario scenario) {
        int lineNumber = scenario.getLines().get(0);
        String fileName = scenario.getUri().replace("file:", "");
        logger.info("Getting example line " + lineNumber + " in file " + fileName);
        return FileHelper.readLineFromFile(lineNumber, fileName);
    }
}
