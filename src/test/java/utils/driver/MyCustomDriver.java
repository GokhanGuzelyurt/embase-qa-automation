package utils.driver;

import embase.tests.StepDefs.CommonSteps;
import io.github.bonigarcia.wdm.WebDriverManager;
import net.thucydides.core.webdriver.DriverSource;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.invoke.MethodHandles;

public class MyCustomDriver implements DriverSource {

    final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @Override
    public WebDriver newDriver() {
        WebDriver driver;
        WebDriverManager.chromedriver().setup();
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-extensions");
        options.addArguments("--verbose");


        if (System.getenv("headless") != null && System.getenv("headless").equals("true")) {
            logger.info("Headless environment variable set to true. Headless ChromeDriver mode: true");
            options.addArguments("--headless");
        } else if (CommonSteps.JENKINS_URL != null) {
            logger.info("Job is running in JENKINS. Headless ChromeDriver mode: true");
            options.addArguments("--headless");
        }

        options.addArguments("no-sandbox");
        driver = new ChromeDriver(options);

        return driver;
    }

    @Override
    public boolean takesScreenshots() {
        return true;
    }
}
