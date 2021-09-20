package utils.testrail.entities;

import java.util.ArrayList;

public class FeatureFile {
    private int sectionId;
    private String name;
    // tags and file header
    private String description;
    private ArrayList<FeatureFileScenario> scenarios;

    public FeatureFile(int id, String name, String description) {
        this.sectionId = id;
        this.name = name;
        this.description = description;
        scenarios = new ArrayList<>();
    }

    public int getSectionId() {
        return sectionId;
    }

    public void setSectionId(int sectionId) {
        this.sectionId = sectionId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<FeatureFileScenario> getScenarios() {
        return scenarios;
    }

    @Override
    public String toString() {
        String text = "@testrail " + description + "\n";

        for (FeatureFileScenario scenario : scenarios) {
            text += "\n";
            if (scenario.getPreconds() != null)
                text += scenario.getPreconds() + "\n";
            text += scenario.getIdString() + "\n";
            text += scenario.getTitle() + "\n";
            text += scenario.getSteps() + "\n";
            text = text.replace("\u00a0", "");
        }
        return text;
    }
}
