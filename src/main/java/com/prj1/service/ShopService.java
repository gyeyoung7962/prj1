package com.prj1.service;


import com.prj1.domain.*;
import com.prj1.mapper.ShopMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ShopService {

    private final ShopMapper mapper;

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

        if(authentication == null){
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
}
