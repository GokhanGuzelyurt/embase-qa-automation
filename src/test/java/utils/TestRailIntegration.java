package utils;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import utils.testrail.TestRailHelper;
import utils.testrail.entities.Case;
import utils.testrail.entities.Section;
import utils.testrail.entities.Test;

import java.io.File;
import java.io.IOException;
import java.lang.invoke.MethodHandles;
import java.nio.file.Paths;
import java.util.ArrayList;

public class TestRailIntegration {

    private static Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    public static String testRailUri = "https://elss.testrail.net";
    public static int projectID = 5; // Embase project
    public static int suiteId = 909;
    public static String testRailUserName = "autotest@quosa.com";
    public static String testRailApiKey = "q0aHai6jAalmaixZibT7-w3mxw/QiQmzdO0ZwU2Iw";
    private static File runPath = Paths.get("src", "test", "resources", "features", "run").toFile();


    public static void main(String[] args) throws IOException {
        logger.info("Get feature files from TestRail.");
        FileUtils.forceMkdir(runPath);
        FileUtils.cleanDirectory(runPath);
        getFeatureFiles();
    }

    private static void getFeatureFiles() {
        // get all sections and put in sections array
        ArrayList<Section> sections = TestRailHelper.getSections();

        for(Section s : sections){
            logger.info(s.getName());
        }

        // get all cases and put in sections array
        ArrayList<Case> cases = TestRailHelper.getCases();

        for(Case c : cases){
            logger.info(c.getTitle());
        }

        //get tests from Run put in casesInRun array
        ArrayList<Test> testsInRun = TestRailHelper.getTestsInRun(2911);

        for(Test t : testsInRun){
            logger.info(t.getCase_id()+"");
        }

    }

}
