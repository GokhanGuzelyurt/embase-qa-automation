package utils;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import utils.testrail.TestRailHelper;
import utils.testrail.entities.*;

import java.io.*;
import java.lang.invoke.MethodHandles;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Properties;

public class TestRailIntegration {

    private static Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    private static Properties properties = PropertiesReader.getProperties("src/test/resources/conf/testrail.properties");
    public static String TESTRAIL_URI = properties.getProperty("testRailUri");
    public static int PROJECT_ID = Integer.parseInt(properties.getProperty("projectId")); // Embase project
    public static int SUITE_ID = Integer.parseInt(properties.getProperty("suiteId"));
    public static String TESTRAIL_USERNAME = properties.getProperty("testRailUserName");
    public static String TESTRAIL_APIKEY = properties.getProperty("testRailApiKey");
    private static File runPath = Paths.get("src", "test", "resources", "features", "run").toFile();
    private static ArrayList<FeatureFile> featureFiles;
    private static int RUN_ID = Integer.parseInt(properties.getProperty("testRunId"));

    public static void main(String[] args) throws IOException {
        if (System.getenv("testRun") != null) {
            RUN_ID = Integer.parseInt(System.getenv("testRun"));
        }
        logger.info("Get feature files from TestRail.");
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
        for (FeatureFile f : featureFiles) {
            for (Case c : cases) {
                if (c.getSection_id() == f.getSectionId()) {
                    if (RUN_ID != 0)
                        for (Test t : testsInRun) {
                            if (t.getCase_id() == c.getId()) {
                                f.getScenarios().add(new FeatureFileScenario(c.getId(), c.getTitle(), c.getCustom_preconds(), c.getCustom_steps()));
                            }
                        }
                    else {
                        f.getScenarios().add(new FeatureFileScenario(c.getId(), c.getTitle(), c.getCustom_preconds(), c.getCustom_steps()));
                    }
                }
            }
        }
    }

    public static void writeToFiles() {
        // write each featureFile to a file
        for (FeatureFile f : featureFiles) {
            if (f.getScenarios().size() >= 1)
                try {
                    Writer out = new BufferedWriter(new OutputStreamWriter(
                            new FileOutputStream(Paths.get(runPath.getPath(), f.getName()).toFile()), "UTF-8"));
                    out.write(f.toString());
                    out.close();
                    logger.info(f.toString());
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }
    }

}
