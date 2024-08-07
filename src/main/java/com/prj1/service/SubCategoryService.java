package com.prj1.service;

import com.prj1.domain.SubCategory;
import com.prj1.mapper.SubCategoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SubCategoryService {

    private final SubCategoryMapper mapper;


    public List<SubCategory> subCategoryList(Integer categoryId) {

        return mapper.getSubCategoryList(categoryId);
    }

    public void addSubCategory(SubCategory subCategory) {

        mapper.addSubCategory(subCategory);

    }

    public int countProduct(Integer subCategoryId) {

        int count = mapper.countProduct(subCategoryId);

        if(count > 0){
            count = 1;
        }
        else if(count == 0){
            count = 0;
        }

        return count;

    }
}
