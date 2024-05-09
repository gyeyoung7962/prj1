package com.prj1.controller;


import com.prj1.domain.Product;
import com.prj1.service.ShopService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/shop")
@RequiredArgsConstructor
public class ShoppingController {

    private final ShopService service;

    @GetMapping("/list")
    public void getShopList(Model model){

        List<Product> list = service.shopProductList();

        model.addAttribute("list", list);
    }

}
