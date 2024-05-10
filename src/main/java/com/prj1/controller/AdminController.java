package com.prj1.controller;


import com.prj1.domain.Category;
import com.prj1.domain.SubCategory;
import com.prj1.service.AdminService;
import com.prj1.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;
    private final CategoryService categoryService;


    @GetMapping("/index")
    @PreAuthorize("hasAnyAuthority('admin')")
    public void adminIndex(){

    }

    //회원 리스트 조회
    @GetMapping("/memberList")
    @PreAuthorize("hasAnyAuthority('admin')") //권한이 admin 회원만 접근가능
    public void listGet(Model model){

        model.addAttribute("list",adminService.memberList());
    }

    @GetMapping("/addProduct")
    @PreAuthorize("hasAnyAuthority('admin')")
    public void getAdd(Model model){

        List<Category> categoryList = categoryService.categoryList();

//        categoryList.forEach(System.out::println);

        model.addAttribute("categoryList", categoryList);

        List<SubCategory> subList = categoryService.subCategoryList();

        model.addAttribute("subCategoryList", subList);

//        subList.forEach(System.out::println);
    }
}
