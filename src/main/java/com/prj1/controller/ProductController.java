package com.prj1.controller;


import com.prj1.domain.Category;
import com.prj1.domain.SubCategory;
import com.prj1.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {

//    private final ProductService service;
    private final CategoryService service;

    @GetMapping("/add")
    @PreAuthorize("hasAnyAuthority('admin')")
    public void getAdd(Model model){

        List<Category> categoryList = service.categoryList();

//        categoryList.forEach(System.out::println);

        model.addAttribute("categoryList", categoryList);

        List<SubCategory> subList = service.subCategoryList();

        model.addAttribute("subCategoryList", subList);

        subList.forEach(System.out::println);

    }


}
