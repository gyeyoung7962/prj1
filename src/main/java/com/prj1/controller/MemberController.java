package com.prj1.controller;


import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @PostMapping("/login")
    public String loginPost(Member member, Model model, HttpServletRequest req){

        HttpSession session = req.getSession();

        Member loginMember = service.loginMember(member);

        if(session != null){
            session.setAttribute("login", loginMember);
            session.setAttribute("nickName", loginMember.getNickName());
            model.addAttribute("session", session);
            model.addAttribute("nickName", loginMember.getNickName());

        }




        return "redirect:/";
    }


    @GetMapping("/list")
    public void listGet(Model model){

        model.addAttribute("list",service.memberList());
    }

    @GetMapping("/info")
    public void infoGet(Integer id,Model model){

        Member member = service.infoMember(id);

        model.addAttribute("member", member);
    }

    @PostMapping("/delete")
    public String delete(Integer id){

        service.deleteMember(id);

        return "redirect:/member/list";
    }

}
