package utils.testrail.entities;

public class Case {

    private int id;
    private String title;
    private int section_id;
    private String custom_preconds;
    private String custom_steps;

    public String getCustom_preconds() {
        return custom_preconds;
    }

    public void setCustom_preconds(String custom_preconds) {
        this.custom_preconds = custom_preconds;
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

    public int getSection_id() {
        return section_id;
    }

    public void setSection_id(int section_id) {
        this.section_id = section_id;
    }

    public String getCustom_steps() {
        return custom_steps;
    }

    public void setCustom_steps(String custom_steps) {
        this.custom_steps = custom_steps;
    }
}
