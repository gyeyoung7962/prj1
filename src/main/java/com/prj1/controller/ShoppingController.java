package com.prj1.controller;

import com.prj1.domain.*;
import com.prj1.service.MemberService;
import com.prj1.service.ProductService;
import com.prj1.service.ShopService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
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
    private final MemberService memberService;

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

        List<ProductQnA> list = service.listQnA(id);


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
        model.addAttribute("writerList", list);
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

    @PostMapping("/addComment")
    public String addComment(CommentQnA commentQnA, @RequestParam("productId") Integer productId, Authentication authentication) {

        System.out.println("상품번호:" + productId);

        if (authentication == null) {
            return "redirect:/member/login";
        } else if (authentication != null) {
            service.addComment(commentQnA, authentication);
            return "redirect:/shop/productInfo?id=" + productId;
        }
        return null;
    }

    @GetMapping("/commentList")
    @ResponseBody
    public List<CommentQnA> commentList(@RequestParam("productQnAId") Integer productQnAId) {

        List<CommentQnA> list = service.commentList(productQnAId);

        list.forEach(System.out::println);

        return list;
    }

    @PostMapping("/addCart")
    @ResponseBody
    public String addCart(Cart cart) {

        //카트에 담긴 회원아이디로 회원정보 조회
        Member member = memberService.infoMember(cart.getMemberId());

        //카트에 담긴 상품아이디로 상품정보 조회
        Product product = service.shopProductInfo(cart.getProductId());

        Cart cartItem = service.selectCartItem(product.getId(), member.getNickName());

        System.out.println("member = " + member);
        System.out.println("product = " + product);
        System.out.println("cartItem = " + cartItem);

        System.out.println("========= 확인===");
        if (cartItem == null) {
            System.out.println("상품 추가");
            service.addCart(cart);
        } else {
            System.out.println("수량 증가" + cart.getQuantity());
            service.updateCart(cart);
        }

        return null;
    }

    @GetMapping("/cartList")
    @PreAuthorize("isAuthenticated()")
    public void getCartList(@RequestParam("id")Integer memberId, Model model){

        List<Cart> cart = service.cartList(memberId);

        cart.forEach(System.out::println);

        model.addAttribute("cartList", cart);

    }


}
