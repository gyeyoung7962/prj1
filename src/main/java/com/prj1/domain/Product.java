package com.prj1.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Product {

    private Integer id;
    private String image;
    private String name;
    private Integer price;
    private Integer quantity;
    private Integer stock;
    private String content;
    private LocalDateTime regDate;
    private Integer subCategoryId;

}
