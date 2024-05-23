package com.prj1.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Cart {

    private Integer id;
    private Integer productId;
    private String name;
    private Integer memberId;
    private LocalDateTime regDate;
    private Integer price;
    private Integer quantity;
    private String path;
}
