package com.prj1.controller;


import com.prj1.domain.Board;
import com.prj1.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {


    private final BoardService service;

    @GetMapping("/add")
    public void add() {

    }

    @PostMapping("/add")
    //글 작성시 게시글정보를 board에 바인딩, 로그인한 사용자정보를 authentication에 담기
    public String addPost(Board board, Authentication authentication, RedirectAttributes rttr) {

        if(authentication == null){

            return "redirect:/member/login";
        }


        System.out.println("authentication = " + authentication);
        System.out.println("principal"+authentication.getPrincipal());
        System.out.println(authentication.getName());

        service.add(board, authentication);


        rttr.addAttribute("id", board.getId());

//        return "redirect:/board/read?id="+board.getId();
        return "redirect:/board/list";
    }

    @GetMapping("/read")
    public String readBoard(Integer id, Model model){

        //게시물 조회(select)
        Board board = service.selectBoard(id);
        //모델에 넣고
        model.addAttribute("board", board);
        //jsp로 포워드

        return "board/read";
    }

    @GetMapping("/list")
    public String listBoard(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model){

        model.addAllAttributes(service.boardList(page));
        return "board/list";
    }

    @PostMapping("/delete")
    public String delete(Integer id, Authentication authentication){

        if(service.hasAccess(id, authentication)){ //값이 true이면
            service.deleteBoard(id); //삭제
        }


        return "redirect        :/board/list";
    }

    @GetMapping("/update")
    public void update(Integer id, Model model){

            model.addAttribute("board", service.selectBoard(id));
    }

    @PostMapping("/update")
    public String postUpdate(Board board, Authentication authentication){

        if(service.hasAccess(board.getId(), authentication)){

            service.boardUpdate(board);
        }

        return "redirect:/board/list";
    }


}
