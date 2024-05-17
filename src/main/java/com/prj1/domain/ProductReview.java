package com.prj1.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ProductReview {

    private Integer id;
    private String content;
    private Integer productId;
    private Integer rating;
    private String writer;
    private Integer memberId;
    private LocalDateTime regDate;
}
