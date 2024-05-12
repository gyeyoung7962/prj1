package com.prj1.service;

import com.prj1.domain.Category;
import com.prj1.domain.SubCategory;
import com.prj1.mapper.CategoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService{

    private final CategoryMapper mapper;


    public List<Category> categoryList() {

        return mapper.categoryList();
    }

    public List<SubCategory> subCategoryList() {
        return mapper.subCategoryList();
    }

    public void addCategory(String categoryName) {

        mapper.addCategory(categoryName);
    }
}
