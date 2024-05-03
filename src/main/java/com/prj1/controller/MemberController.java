package com.prj1.controller;


import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String loginGet(){

        return "member/login";
    }

    /*
    @PostMapping("/login")
    public String loginPost(Member member,Model model, HttpServletRequest req){

        HttpSession session = req.getSession();




        Member loginMember = service.loginMember(member);

        if(session != null && loginMember !=null){
            session.setAttribute("login", loginMember);
            session.setAttribute("nickName", loginMember.getNickName());
            session.setMaxInactiveInterval(1800);
            model.addAttribute("session", session);
            model.addAttribute("nickName", loginMember.getNickName());
            model.addAttribute("id", loginMember.getId());
        }
        else if(loginMember == null){
            return "redirect:/member/login";
        }
        return "redirect:/";
    }

     */

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
    public String delete(Integer id, Authentication authentication, HttpServletRequest req){

        if(service.hasAccess(id, authentication)){
            service.deleteMember(id);
            HttpSession session = req.getSession();
            session.invalidate();
        }

        return "redirect:/member/list";
    }

    @GetMapping("/update")
    public void update(Integer id, Model model){

        model.addAttribute("member", service.infoMember(id));
    }


    @PostMapping("/update")
    public String update(Member member, Authentication authentication, RedirectAttributes rttr){

        if(service.hasAccess(member.getId(), authentication)){

            service.updateMember(member);
        }

        rttr.addAttribute("id", member.getId());

        return "redirect:/member/info";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest req){

        HttpSession session = req.getSession();

        session.invalidate();

        return "redirect:/";
    }

    @GetMapping("/emailChk")
    @ResponseBody
    public int emailChk(@RequestParam("email") String email){

        System.out.println("email = " + email);

        return service.emailChk(email);
    }


}
