package com.prj1.controller;

import com.prj1.domain.*;
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
        int countQnA = service.countQnA(id); //질문글 개수

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
        model.addAttribute("countQnA", countQnA);
    }

    @PostMapping("/productReview")
    public String addReview(ProductReview review, Authentication authentication) {

        if (authentication == null) {
            return "redirect:/member/login";
        } else if (authentication != null) {
            service.addReview(review, authentication);
            return "redirect:/shop/productInfo?id=" + review.getProductId();
        }

        return null;
    }

    @GetMapping("/reviewList")
    @ResponseBody
    public List<ProductReview> reviewList(@RequestParam("productId") Integer productId) {

        List<ProductReview> list = service.reviewList(productId);

        return list;
    }

    @GetMapping("/reviewCount")
    @ResponseBody
    public int reviewCount(@RequestParam("productId") Integer productId) {

        int reviewCount = service.reviewCount(productId);

        return reviewCount;
    }

    @GetMapping("/reviewAvgScore")
    @ResponseBody
    public Double reviewAvgScore(@RequestParam("productId") Integer productId) {

        Double reviewAvgScore = service.reviewAvgScore(productId);

        return reviewAvgScore;
    }

    @PostMapping("/addQnA")
    public String addQuestion(ProductQnA productQnA, Authentication authentication) {

        if (authentication == null) {
            return "redirect:/member/login";
        } else if (authentication != null) {
            service.addQnA(productQnA, authentication);
            return "redirect:/shop/productInfo?id=" + productQnA.getProductId();
        }
        return null;
    }

    @GetMapping("/listQnA")
    @ResponseBody
    public List<ProductQnA> listQnA(@RequestParam("productId") Integer productId) {

        List<ProductQnA> list = service.listQnA(productId);
        return list;
    }

    @GetMapping("/countQnA")
    @ResponseBody
    public int countQnA(@RequestParam("productId") Integer productId) {

        int countQnA = service.countQnA(productId);

        return countQnA;
    }


}
