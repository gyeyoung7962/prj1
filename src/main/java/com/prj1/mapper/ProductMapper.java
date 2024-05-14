package com.prj1.mapper;


import com.prj1.domain.Product;
import com.prj1.domain.ProductImg;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProductMapper {

    @Insert("""
            insert into product(name, price, stock, content, subCategory_id)
            values (#{name}, #{price}, #{stock}, #{content}, #{subCategoryId})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void add(Product product);

    @Select("""
            select *
            from product
            """)
    List<Product> productList();

    @Insert("""
            insert into product_img(name, path, product_id, is_title_img)
            values (#{name}, #{path}, #{product_id}, #{isTitleImg})
            """)
    void addImg(ProductImg productImg);
}
