package com.prj1.mapper;


import com.prj1.domain.Category;
import com.prj1.domain.SubCategory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CategoryMapper {


    @Select("""
            select *
            from category
            """)
    List<Category> categoryList();

    @Select("""
            select *
            from subCategory
            order by parent_category_id, subCategory_id
            """)
    List<SubCategory> subCategoryList();
}
