package utils.driver;

import io.github.bonigarcia.wdm.WebDriverManager;
import net.thucydides.core.webdriver.DriverSource;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class MyCustomDriver implements DriverSource {

    @Override
    public WebDriver newDriver() {
        WebDriver driver;
        WebDriverManager.chromedriver().setup();
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-extensions");

        // for debugging purposes
        options.addArguments("--verbose");

//        if (BaseSteps.getProperty("headless").equals("true"))
            options.addArguments("--headless");

        options.addArguments("no-sandbox");
        driver = new ChromeDriver(options);

        return driver;
    }

    @Override
    public boolean takesScreenshots() {
        return true;
    }
}
