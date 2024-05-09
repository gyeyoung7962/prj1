package com.prj1.service;


import com.prj1.domain.Product;
import com.prj1.mapper.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductMapper mapper;


    public void add(Product product, MultipartFile file) throws IOException {

        String uploadPath = System.getProperty("user.dir")+"/src/main/resources/static/upload";

        String fileName = System.currentTimeMillis()+"_"+file.getOriginalFilename();

        File saveFile = new File(uploadPath, fileName);

        file.transferTo(saveFile);

        product.setImage(fileName);

        mapper.add(product);
    }

    public List<Product> productList() {

        return mapper.productList();
    }
}
