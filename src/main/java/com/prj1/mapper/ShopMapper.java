package com.prj1.mapper;


import com.prj1.domain.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ShopMapper {



    @Select("""
            select *
            from product
            """)
    List<Product> shopProductList();
}
