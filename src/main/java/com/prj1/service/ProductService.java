package com.prj1.service;


import com.prj1.domain.Product;
import com.prj1.domain.ProductImg;
import com.prj1.mapper.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductMapper mapper;


    @Transactional(rollbackFor = Exception.class)
    public void add(Product product, List<MultipartFile> files) throws IOException {

        mapper.add(product);

        int productId = product.getId();

        System.out.println("file size"+files.size());

        String uploadPath = System.getProperty("user.dir")+"/src/main/resources/static/upload";


        for(int i = 0; i < files.size();i++){

            String fileName = files.get(i).getOriginalFilename();
            String filePath = System.currentTimeMillis()+"_"+fileName;

            File saveFile = new File(uploadPath, filePath);

            files.get(i).transferTo(saveFile);

            ProductImg productImg = new ProductImg();

            productImg.setProduct_id(productId);
            productImg.setName(fileName);
            productImg.setPath(filePath);

            if(i == 0){
                productImg.setIsTitleImg(true);
            }
            else{
                productImg.setIsTitleImg(false);
            }


            mapper.addImg(productImg);
        }

//        String fileName = System.currentTimeMillis()+"_"+file.getOriginalFilename();
//        File saveFile = new File(uploadPath, fileName);
//        file.transferTo(saveFile);

//        productImg.setProduct_id(productId);
//        productImg.setName(file.getOriginalFilename());
//        productImg.setPath(fileName);

//        mapper.addImg(productImg);
    }


    /*
    public void add(Product product, MultipartFile file) throws IOException {

        String uploadPath = System.getProperty("user.dir")+"/src/main/resources/static/upload";

        String fileName = System.currentTimeMillis()+"_"+file.getOriginalFilename();

        File saveFile = new File(uploadPath, fileName);

        file.transferTo(saveFile);

        product.setImage(fileName);

        mapper.add(product);
    }
     */

    public List<Product> productList() {

        return mapper.productList();
    }
}
