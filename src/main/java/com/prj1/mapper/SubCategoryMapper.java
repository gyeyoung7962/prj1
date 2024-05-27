package com.prj1.mapper;

import com.prj1.domain.SubCategory;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SubCategoryMapper {

    @Select("""
            select *
            from subCategory
            where parent_category_id = #{categoryId}
            """)
    List<SubCategory> getSubCategoryList(Integer categoryId);

    @Insert("""
            insert into subCategory(parent_category_id, subCategory_name)
            values(#{parentCategoryId}, #{subCategoryName})
            """)
    void addSubCategory(SubCategory subCategory);
}
