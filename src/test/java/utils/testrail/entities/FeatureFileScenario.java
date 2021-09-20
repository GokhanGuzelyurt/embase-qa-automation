package utils.testrail.entities;

public class FeatureFileScenario {

    private int id;
    private String title;
    private String preconds;
    private String steps;
    private String idString;

    public FeatureFileScenario(int id, String title, String preconds, String custom_steps) {
        this.id = id;
        this.title = title;
        this.preconds = preconds;
        this.steps = custom_steps;
        this.idString = "@C" + id;
    }

    public String getIdString() {
        return idString;
    }

    public void setIdString(String idString) {
        this.idString = idString;
    }

    public String getPreconds() {
        return preconds;
    }

    public void setPreconds(String preconds) {
        this.preconds = preconds;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSteps() {
        return steps;
    }

    public void setSteps(String steps) {
        this.steps = steps;
    }
}
