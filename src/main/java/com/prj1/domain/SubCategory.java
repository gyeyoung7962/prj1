package com.prj1.domain;

import lombok.Data;

@Data
public class SubCategory {


    private Integer subCategoryId;
    private Integer parentCategoryId;
    private String subCategoryName;
}
