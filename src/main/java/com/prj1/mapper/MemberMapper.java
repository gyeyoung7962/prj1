package com.prj1.mapper;


import com.prj1.domain.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MemberMapper {


    @Insert("""
            insert into member(email, password, nick_name)
            values(#{email}, #{password}, #{nick_name})
            
            """)
    void insertMember(Member member);

    @Select("""
            select *
            from member
            order by id desc
            """)
    List<Member> memberList();

    @Select("""
            select *
            from member
            where id = #{id}
            """)
    Member infoMember(Integer id);

    @Select("""
            select *
            from member
            where id = #{id} and password = #{password}
            """)
    Member loginMember(Member member);
}
