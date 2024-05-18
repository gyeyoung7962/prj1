package com.prj1.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ProductQnA {

    private Integer id;
    private String title;
    private String content;
    private Integer productId;
    private String writer;
    private LocalDateTime regDate;
}
