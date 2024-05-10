package com.prj1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class NaverLoginController {


    @GetMapping("/naver-login")
    public String getNaverLogin(){

        return "member/naverLogin";
    }

}
