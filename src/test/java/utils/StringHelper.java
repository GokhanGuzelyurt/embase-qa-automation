package utils;

import embase.tests.StepDefs.CommonSteps;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringHelper {

    public static String urlEncode(String textToEncode) {
        try {
            return URLEncoder.encode(textToEncode, StandardCharsets.UTF_8.toString());
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex.getCause());
        }
    }

    public static String getRegex(String text, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(text);
        if (matcher.find()) {
            return matcher.group(0);
        }
        return "";
    }

    public static String millisToTimespan(long millis) {
        Duration timeLeft = Duration.ofMillis(millis);
        long hours = timeLeft.toHours();
        timeLeft = timeLeft.minusHours(hours);
        long minutes = timeLeft.toMinutes();
        timeLeft = timeLeft.minusMinutes(minutes);
        long seconds = timeLeft.toMillis() / 1000;
        String hms = String.format("%02dh %02dm %02ds", hours, minutes, seconds);
        return hms;
    }

    public static String resolveVariable(String var){
        if (var.substring(0, 1).equals("$"))
            return CommonSteps.testCaseVariables.get(var);

        return var;
    }
}
