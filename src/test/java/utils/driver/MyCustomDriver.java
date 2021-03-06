package utils.driver;

import embase.tests.StepDefs.CommonSteps;
import io.github.bonigarcia.wdm.WebDriverManager;
import net.thucydides.core.webdriver.DriverSource;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import utils.TestRailIntegration;

import java.io.File;
import java.io.IOException;
import java.lang.invoke.MethodHandles;
import java.util.HashMap;
import java.util.Map;

public class MyCustomDriver implements DriverSource {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @Override
    public WebDriver newDriver() {
        WebDriver driver;
        WebDriverManager.chromedriver().setup();
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-extensions");
        options.addArguments("--verbose");
        options.addArguments("--kiosk-printing");

        File downloadFolder = null;
        String downloadFilepath = "";
        String parentDirectoryPath = System.getProperty("user.dir");
        if (System.getenv("headless") != null && System.getenv("headless").equals("true")) {
            logger.info("Headless environment variable set to true. Headless ChromeDriver mode: true");
            options.addArguments("--headless");
        } else if (CommonSteps.JENKINS_BUILD_URL != null) {
            logger.info("Job is running in JENKINS. Headless ChromeDriver mode: true");
            options.addArguments("--headless");
            TestRailIntegration.SEND_RESULTS_TESTRAIL = true;
            downloadFilepath = parentDirectoryPath+"" + "/src/test/resources/downloads";
            logger.info("Chrome Download path set to: "+downloadFilepath);
            downloadFolder = new File(downloadFilepath);
        } else {
            logger.info("Chromedriver Headless is FALSE. Instantiating window.");
            downloadFilepath = parentDirectoryPath+"" + "\\src\\test\\resources\\downloads";
            logger.info("Chrome Download path set to: "+downloadFilepath);
            downloadFolder = new File(downloadFilepath);
        }

        if (downloadFolder.exists()) {
            try {
                FileUtils.deleteDirectory(downloadFolder);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        downloadFolder.mkdir();

        Map<String, Object> prefs = new HashMap<>();
        prefs.put("profile.default_content_settings.popups", 0);
        prefs.put("download.prompt_for_download", false);
        prefs.put("download.directory_upgrade", true);
        prefs.put("safebrowsing.enabled", true);
        prefs.put("download.default_directory", downloadFilepath);
        options.setExperimentalOption("prefs", prefs);

        options.addArguments("no-sandbox");
        driver = new ChromeDriver(options);

        return driver;
    }

    @Override
    public boolean takesScreenshots() {
        return true;
    }
}
