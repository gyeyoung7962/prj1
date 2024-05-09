package com.prj1.mapper;


import com.prj1.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProductMapper {

    @Insert("""
            insert into product(image, name, price, stock, content, subCategory_id)
            values (#{image}, #{name}, #{price}, #{stock}, #{content}, #{subCategoryId})
            """)
    void add(Product product);

    @Select("""
            select *
            from product
            """)
    List<Product> productList();

}
