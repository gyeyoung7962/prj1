package com.prj1.controller;

import com.prj1.domain.Product;
import com.prj1.domain.ProductImg;
import com.prj1.domain.ProductReview;
import com.prj1.service.ShopService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

        int reviewCount = service.reviewCount(id); //리뷰글 개수

        List<ProductImg> productImg = service.shopProductImg(id);

        //메인이미지 조회
        String mainImage = service.selectMainImage(id);

        //서브이미지 조회
        List<ProductImg> subImageList = service.selectSubImageList(id);

        model.addAttribute("product", product);
        model.addAttribute("productImg", productImg);
        model.addAttribute("mainImage", mainImage);
        model.addAttribute("subImageList", subImageList);
        model.addAttribute("reviewCount", reviewCount);
    }

    @PostMapping("/productReview")
    public String addReview(ProductReview review, Authentication authentication){

        service.addReview(review, authentication);

        return "redirect:/shop/productInfo?id="+review.getProductId();
    }

    @GetMapping("/reviewList")
    @ResponseBody
    public List<ProductReview> reviewList(@RequestParam("productId") Integer productId){

        List<ProductReview> list = service.reviewList(productId);

        list.forEach(System.out::println);

        return list;
    }

    @GetMapping("/reviewCount")
    @ResponseBody
    public int reviewCount(@RequestParam("productId") Integer productId){

        int reviewCount = service.reviewCount(productId);

        return reviewCount;
    }

    @GetMapping("/reviewAvgScore")
    @ResponseBody
    public double reviewAvgScore(@RequestParam("productId") Integer productId){

        double reviewAvgScore = service.reviewAvgScore(productId);

        return reviewAvgScore;
    }


}
