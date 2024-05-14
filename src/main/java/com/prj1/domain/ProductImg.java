package com.prj1.domain;

import lombok.Data;

@Data
public class ProductImg {

    private Integer id;
    private String name;
    private String path;
    private Integer product_id;
    private Boolean isTitleImg;
}
