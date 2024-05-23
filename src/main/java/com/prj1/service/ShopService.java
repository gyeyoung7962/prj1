package com.prj1.service;


import com.prj1.domain.*;
import com.prj1.mapper.MemberMapper;
import com.prj1.mapper.ShopMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ShopService {

    private final ShopMapper mapper;
    private final MemberMapper memberMapper;

    public List<Product> shopProductList() {

        return mapper.shopProductList();
    }

    public Product shopProductInfo(Integer id) {

        return mapper.shopProductInfo(id);
    }

    public List<ProductImg> shopProductImg(Integer id) {

        return mapper.shopProductImgInfo(id);
    }

    public String selectMainImage(Integer id) {

        return mapper.selectMainImage(id);
    }

    public List<ProductImg> selectSubImageList(Integer id) {

        return mapper.selectSubImageList(id);
    }

    public void addReview(ProductReview review, Authentication authentication) {

        if (authentication == null) {
            return;
        }

        Object principal = authentication.getPrincipal();

        if (principal instanceof CustomUser user) {

            Member member = user.getMember();
            review.setMemberId(member.getId());
            review.setWriter(member.getNickName());
            mapper.addReview(review);
        }
    }

    public List<ProductReview> reviewList(Integer productId) {
        return mapper.reviewList(productId);
    }

    public int reviewCount(Integer id) {
        return mapper.reviewCount(id);
    }

    public Double reviewAvgScore(Integer productId) {
        return mapper.reviewAvgScore(productId);
    }

    public void addQnA(ProductQnA productQnA, Authentication authentication) {

        if (authentication == null) {
            return;
        }

        Object principal = authentication.getPrincipal();

        if (principal instanceof CustomUser user) {

            Member member = user.getMember();

            productQnA.setWriter(member.getNickName());
            mapper.addQnA(productQnA);
        }

    }

    public List<ProductQnA> listQnA(Integer productId) {
        return mapper.listQnA(productId);
    }

    public int countQnA(Integer productId) {

        return mapper.countQnA(productId);
    }

    public void addComment(CommentQnA commentQnA, Authentication authentication) {

        if (authentication == null) {
            return;
        }

        Object principal = authentication.getPrincipal();

        if (principal instanceof CustomUser user) {
            Member member = user.getMember();
            commentQnA.setWriter(member.getNickName());
            mapper.addComment(commentQnA);
        }
    }

    public List<CommentQnA> commentList(Integer productQnAId) {

        return mapper.commentList(productQnAId);
    }

    public void addCart(Cart cart) {

        mapper.add(cart);


//        Member member = memberMapper.infoMember(cart.getMemberId());

//        System.out.println(member);

//        System.out.println(mapper.selectCartProductId(member.getEmail()));

//         if(productId == cart.getProductId()){
//             System.out.println("주문한 물건이 같아서 수량을 올려야합니다");
//         }
//         if(productId != cart.getProductId()){
//             System.out.println("장바구니에 "+cart.getProductId()+"의 상품이 없어서 추가합니다");
//             mapper.add(cart);
//         }

    }

    public Cart selectCartItem(Integer id, String nickName) {

        return mapper.selectCartItem(id,nickName);

    }

    public void updateCart(Cart cart) {

        mapper.updateCart(cart);
    }

    public List<Cart> cartList(Integer memberId) {

        return mapper.cartList(memberId);
    }
}

