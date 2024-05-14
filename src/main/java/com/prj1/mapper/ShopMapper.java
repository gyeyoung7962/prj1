package com.prj1.mapper;


import com.prj1.domain.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ShopMapper {



    @Select("""
            select p.name , pi.path as image
            from product p join product_img pi
            on p.id = pi.product_id and pi.is_title_img = 1;
            """)
    List<Product> shopProductList();
}
