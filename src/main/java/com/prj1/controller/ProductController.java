package com.prj1.controller;


import com.prj1.domain.Category;
import com.prj1.domain.Product;
import com.prj1.domain.SubCategory;
import com.prj1.service.CategoryService;
import com.prj1.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;
    private final CategoryService categoryService;



    @PostMapping("/add")
    public String postAdd(Product product, MultipartFile file) throws Exception{

        productService.add(product, file);

        return "redirect:/";
    }

    @GetMapping("/list")
    public void getList(Model model){

        List<Product> list = productService.productList();

        model.addAttribute("list", list);

    }


}
