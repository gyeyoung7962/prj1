package com.prj1.controller;


import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService service;

    @GetMapping("/join")
    public void joinGet(){

    }

    @PostMapping("/join")
    public String joinPost(Member member){

        service.insertMember(member);

        return "redirect:/";
    }


    @GetMapping("/login")
    public void loginGet(){

    }
}
