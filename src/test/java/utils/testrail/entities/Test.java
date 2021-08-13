package utils.testrail.entities;

public class Test {

    private int case_id;
    private int status_id;
    private int run_id;
//    private String title;
//    private String custom_steps;


    public int getCase_id() {
        return case_id;
    }

    public void setCase_id(int case_id) {
        this.case_id = case_id;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public int getRun_id() {
        return run_id;
    }

    public void setRun_id(int run_id) {
        this.run_id = run_id;
    }
}
