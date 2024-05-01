package com.prj1.controller;


import com.prj1.domain.Board;
import com.prj1.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String addPost(Board board, RedirectAttributes rttr) {

        System.out.println("board = " + board);

        rttr.addAttribute("id", board.getId());
        service.add(board);

//        return "redirect:/board/read?id="+board.getId();
        return "redirect:/board/read";
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
    public String listBoard(Model model){

        //게시물 목록 조회(select)
        List<Board> list = service.boardList();
        //모델에 넣고
        model.addAttribute("list", list);
        //jsp로 포워드

        return "board/list";
    }

    @PostMapping("/delete")
    public String deleteBoard(Integer id){

        System.out.println("id :" +id);

        service.deleteBoard(id);

        return "redirect:/board/list";
    }


}
