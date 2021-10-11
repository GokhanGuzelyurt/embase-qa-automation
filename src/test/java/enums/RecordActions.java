package enums;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public enum RecordActions {
    View("View"),
    Print("Print"),
    Export("Export"),
    Email("Email"),
    AddToClipboard("Add to Clipboard");

    private String name;

    RecordActions(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public static List<String> getNames() {
        return Arrays.stream(RecordActions.values()).map(RecordActions::name).collect(Collectors.toList());
    }
}
