package com.prj1.controller;


import com.prj1.domain.Category;
import com.prj1.domain.SubCategory;
import com.prj1.service.AdminService;
import com.prj1.service.CategoryService;
import com.prj1.service.SubCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;
    private final CategoryService categoryService;
    private final SubCategoryService subCategoryService;



    @GetMapping("/index")
    @PreAuthorize("hasAnyAuthority('admin')")
    public void adminIndex() {

    }

    //회원 리스트 조회
    @GetMapping("/memberList")
    @PreAuthorize("hasAnyAuthority('admin')") //권한이 admin 회원만 접근가능
    public void listGet(Model model) {

        model.addAttribute("list", adminService.memberList());
    }

    @GetMapping("/addProduct")
    @PreAuthorize("hasAnyAuthority('admin')")
    public void getAdd(Model model) {

        List<Category> categoryList = categoryService.categoryList();

//        categoryList.forEach(System.out::println);

        model.addAttribute("categoryList", categoryList);

        List<SubCategory> subList = categoryService.subCategoryList();

        model.addAttribute("subCategoryList", subList);

//        subList.forEach(System.out::println);
    }

    @GetMapping("/categorySetting")
    @PreAuthorize("hasAuthority('admin')")
    public void getCategorySetting() {

    }

    @GetMapping("/getCategory")
    @ResponseBody
    public List<Category> getCategory() {

        List<Category> list = categoryService.categoryList();

        list.forEach(System.out::println);

        return list;
    }

    @PostMapping("/addCategory")
    public String postCategory(@RequestParam("category") String categoryName) {

        System.out.println("category:" + categoryName);
        categoryService.addCategory(categoryName);

        return "redirect:/admin/categorySetting";
    }

    @GetMapping("/getSubCategory")
    @ResponseBody
    public List<SubCategory> getSubCategory(@RequestParam("categoryId")Integer categoryId){

        System.out.println("categoryId:"+categoryId);

        List<SubCategory> list = subCategoryService.subCategoryList(categoryId);

        return list;
    }

    @PostMapping("/addSubCategory")
    @ResponseBody
    public String addSubCategory(SubCategory subCategory){

        subCategoryService.addSubCategory(subCategory);

        return null;
    }
}


