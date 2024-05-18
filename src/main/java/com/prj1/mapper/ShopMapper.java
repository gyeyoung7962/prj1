package com.prj1.mapper;


import com.prj1.domain.Product;
import com.prj1.domain.ProductImg;
import com.prj1.domain.ProductQnA;
import com.prj1.domain.ProductReview;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ShopMapper {


    @Select("""
            select p.id, p.name , pi.path as image, p.price
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

    @Insert("""
            insert into product_review(writer, content, rating, product_id, member_id)
            values(#{writer}, #{content}, #{rating}, #{productId}, #{memberId})
            """)
    void addReview(ProductReview review);

    @Select("""
            select pr.content, pr.rating, pr.writer, p.id, pr.regDate
            from product_review pr join product p
            on pr.product_id = p.id
            where p.id = #{productId}
            order by pr.id desc
                        
            """)
    List<ProductReview> reviewList(Integer productId);

    @Select("""
            select count(pr.id)
            from product p join product_review pr
            on p.id = pr.product_id
            where p.id = #{id}
            """)
    int reviewCount(Integer id);


    @Select("""
            select round(avg(pr.rating), 1)
            from product_review pr join product p
                                        on pr.product_id = p.id
            where p.id = #{productId}
            """)
    Double reviewAvgScore(Integer productId);

    @Insert("""
            insert into product_qna(title, content, writer, product_id)
            values(#{title},#{content},#{writer},#{productId})
            """)
    void addQnA(ProductQnA productQnA);

    @Select("""
            select pq.id, pq.writer, pq.title, pq.regDate, pq.content
            from product_qna pq join product p
            on pq.product_id = p.id
            where p.id = #{productId}
            order by pq.id desc;
            """)
    List<ProductQnA> listQnA(Integer productId);

    @Select("""
            select count(p.id)
            from product_qna pq join product p
            on pq.product_id = p.id
            where p.id = #{productId}
            """)
    int countQnA(Integer productId);
}
