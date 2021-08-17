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

public class TestRailIntegration {

    private static Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    public static String testRailUri = "";
    public static int projectID = 5; // Embase project
    public static int suiteId = 909;
    public static String testRailUserName = "autotest@quosa.com";
    public static String testRailApiKey = "q0aHai6jAalmaixZibT7-w3mxw/QiQmzdO0ZwU2Iw";
    private static File runPath = Paths.get("src", "test", "resources", "features", "run").toFile();
    private static ArrayList<FeatureFile> featureFiles;
    private static int runId = 0; //2911

    public static void main(String[] args) throws IOException {
        if (System.getenv("testRun") != null) {
            runId = Integer.parseInt(System.getenv("testRun"));
        }
        logger.info("Get feature files from TestRail.");
        FileUtils.forceMkdir(runPath);
        FileUtils.cleanDirectory(runPath);
        getAllFeatureFiles();
        writeToFiles();
    }

    private static void getAllFeatureFiles() {

        featureFiles = new ArrayList<>();
        // get all sections and put in featureFiles array
        ArrayList<Section> sections = TestRailHelper.getSections();
        for (Section s : sections) {
            if (s.getName().contains(".feature"))
                featureFiles.add(new FeatureFile(s.getId(), s.getName(), s.getDescription()));
        }

        ArrayList<Test> testsInRun = null;
        if (runId != 0) {
            testsInRun = TestRailHelper.getTestsInRun(runId);
        }

        // get all cases and put the cases in the featureFiles array
        ArrayList<Case> cases = TestRailHelper.getCases();
        for (FeatureFile f : featureFiles) {
            for (Case c : cases) {
                if (c.getSection_id() == f.getSectionId()) {
                    if (runId != 0)
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
