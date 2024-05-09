package com.prj1.service;


import com.prj1.domain.Product;
import com.prj1.mapper.ShopMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ShopService {

    private final ShopMapper mapper;

    public List<Product> shopProductList() {

        return mapper.shopProductList();

    }
}
