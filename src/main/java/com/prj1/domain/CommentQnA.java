package com.prj1.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CommentQnA {

    private Integer id;
    private Integer productQnAId;
    private String content;
    private LocalDateTime regDate;
    private String writer;
}
