package com.prj1.service;


import com.prj1.domain.Product;
import com.prj1.domain.ProductImg;
import com.prj1.mapper.ShopMapper;
import lombok.RequiredArgsConstructor;
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
}
