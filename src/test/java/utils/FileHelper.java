package utils;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Stream;

public class FileHelper {
    public static String readFile(String fileName) {
        StringBuilder contentBuilder = new StringBuilder();
        String userDir = new File(System.getProperty("user.dir")).getAbsolutePath();
        try (Stream<String> stream = Files.lines(Paths.get(userDir + "/src/test/resources/" + fileName), StandardCharsets.UTF_8)) {
            stream.forEach(s -> contentBuilder.append(s));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return contentBuilder.toString();
    }

    public static String readLineFromFile(int lineNumber, String fileName) {
        try {
            FileInputStream fstream = new FileInputStream(fileName);
            BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
            String strLine;
            int counter = 0;
            while ((strLine = br.readLine()) != null) {
                counter++;
                if (counter == lineNumber) {
                    return strLine;
                }
            }
            fstream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static List<String> readLines(String fileName) throws IOException {
        try {
            return Files.readAllLines(Paths.get(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    // used to put text in a local text file
    public static void addTextToFile(String fileName, String text) {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(fileName, true));
            writer.append(text);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}


