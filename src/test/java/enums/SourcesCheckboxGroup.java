package enums;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public enum SourcesCheckboxGroup {

    Embase("Embase"),
    MEDLINE("MEDLINE"),
    EmbaseClassic("Embase Classic"),
    French("French local collection"),
    Preprints("Preprints"),
    PubMedNotMEDLINE("PubMed-not-MEDLINE");

    private String name;

    SourcesCheckboxGroup(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public static List<String> getNames() {
        return Arrays.stream(SourcesCheckboxGroup.values()).map(SourcesCheckboxGroup::getName).collect(Collectors.toList());
    }
}
