package utils.testrail.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Result {

    private int caseId;
    private int testId;
    private int statusId;
    private String comment;
    private Screenshot screenshot;


}
