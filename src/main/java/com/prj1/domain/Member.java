package com.prj1.domain;

import lombok.Data;

@Data
public class Member {
    private Integer id;
    private String email;
    private String password;
    private String nick_name;
}
