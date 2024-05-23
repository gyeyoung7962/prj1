package com.prj1.mapper;


import com.prj1.domain.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

    @Insert("""
            insert into comment_qna(product_qna_id, content, writer)
            values(#{productQnAId}, #{content}, #{writer})
            """)
    void addComment(CommentQnA commentQnA);

    @Select("""
            select cq.writer, cq.content, cq.regDate
            from comment_qna cq join product_qna pq
            on cq.product_qna_id = pq.id
            where pq.id = #{productQnAId}
            """)
    List<CommentQnA> commentList(Integer productQnAId);

    @Insert("""
            insert into cart(product_id, member_id, quantity, price, original_price)
            values (#{productId}, #{memberId}, #{quantity}, #{price}, #{originalPrice})
            """)
    void add(Cart cart);


    @Select("""
            select c.product_id
            from cart c join member m
                             on c.member_id = m.id
                        join product p
                             on p.id = c.product_id
            where m.email = #{email}
            """)
    int selectCartProductId(String email);

    @Select("""
            select c.product_id, c.quantity, c.price
            from cart c join member m
                             on c.member_id = m.id
                        join product p on c.product_id = p.id
            where p.id = #{id} and m.nick_name = #{nickName}
            """)
    Cart selectCartItem(Integer id, String nickName);

    @Update("""
            update cart
            set quantity = cart.quantity +#{quantity}, price = price + #{price}
            where product_id = #{productId}
            """)
    void updateCart(Cart cart);

    @Select("""
            select  c.original_price ,c.product_id, p.name, c.quantity, c.price, pi.path, c.regDate
            from cart c
                     join member m
                          on c.member_id = m.id
                     join product p on c.product_id = p.id
                    join product_img pi
                    on pi.product_id = p.id
            where m.id = #{memberId}
            order by c.regDate desc
            """)
    List<Cart> cartList(Integer memberId);
}
