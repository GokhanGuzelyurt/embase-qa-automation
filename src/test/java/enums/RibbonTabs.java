package enums;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public enum RibbonTabs {
    Mapping("Mapping"),
    Date("Date"),
    Sources("Sources"),
    Fields("Fields"),
    QuickLimits("Quick limits"),
    EBM("EBM"),
    PubTypes("Pub. types"),
    Languages("Languages"),
    Gender("Gender"),
    Age("Age"),
    Animal("Animal"),
    DrugFields("Drug fields"),
    DrugSubheadings("Drug subheadings"),
    Routes("Routes"),
    DiseaseSubheadings("Disease subheadings"),
    DeviceSubheadings("Device subheadings"),
    DeviceFields("Device fields"),
    SearchTips("Search tips");

    private String name;

    RibbonTabs(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public static List<String> getNames() {
        return Arrays.stream(RibbonTabs.values()).map(RibbonTabs::name).collect(Collectors.toList());
    }

}
