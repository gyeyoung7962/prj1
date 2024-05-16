package com.prj1.controller;

import com.prj1.domain.Product;
import com.prj1.domain.ProductImg;
import com.prj1.service.ShopService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/shop")
@RequiredArgsConstructor
public class ShoppingController {

    private final ShopService service;

    @GetMapping("/list")
    public void getShopList(Model model) {

        List<Product> list = service.shopProductList();

        model.addAttribute("list", list);
    }

    @GetMapping("/productInfo")
    public void getProductInfo(Model model, @RequestParam("id") Integer id) {

        Product product = service.shopProductInfo(id); //상품 정보조회

//        System.out.println("product = " + product);


        List<ProductImg> productImg = service.shopProductImg(id);

        //메인이미지 조회
        String mainImage = service.selectMainImage(id);

        //서브이미지 조회
        List<ProductImg> subImageList = service.selectSubImageList(id);

        model.addAttribute("product", product);
        model.addAttribute("productImg", productImg);
        model.addAttribute("mainImage", mainImage);
        model.addAttribute("subImageList", subImageList);


    }

}
