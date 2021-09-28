package utils.testrail.entities;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaginatedResponse {


    private int offset;
    private int limit;
    private int size;
    private PaginationLinks _links;

    private Sections sections;
    private Cases cases;
    private Tests tests;
}
