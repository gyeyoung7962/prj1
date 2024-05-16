package com.prj1.mapper;


import com.prj1.domain.Product;
import com.prj1.domain.ProductImg;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ShopMapper {



    @Select("""
            select p.id, p.name , pi.path as image
            from product p join product_img pi
            on p.id = pi.product_id and pi.is_title_img = 1
            order by p.id desc;
            """)
    List<Product> shopProductList();

    @Select("""
            select *
            from product
            where id = #{id}
            """)
    Product shopProductInfo(Integer id);

    @Select("""
            select *
            from product_img
            where product_id = #{id}
            """)
    List<ProductImg> shopProductImgInfo(Integer id);

    @Select("""
            select path
            from product_img
            where product_id = #{id} and is_title_img=1;
            """)
    String selectMainImage(Integer id);

    @Select("""
            select path
            from product_img
            where product_id = #{id} and is_title_img =0;
            """)
    List<ProductImg> selectSubImageList(Integer id);
}
