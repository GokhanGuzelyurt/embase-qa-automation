package utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class PropertiesReader {


    private static String PROPERTIES_FILE;
    private static Properties properties;

    public static Properties getProperties(String path) {
        PROPERTIES_FILE = path;
        // load properties file
        if (properties == null) {
            File file = new File(PROPERTIES_FILE);
            FileInputStream fileInput = null;
            try {
                fileInput = new FileInputStream(file);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            properties = new Properties();
            try {
                properties.load(fileInput);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return properties;
    }


}
