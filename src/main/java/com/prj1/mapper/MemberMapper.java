package com.prj1.mapper;


import com.prj1.domain.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MemberMapper {


    @Insert("""
            insert into member(email, password, nick_name)
            values(#{email}, #{password}, #{nickName})
            
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
            where email = #{email} and password = #{password}
            """)
    Member loginMember(Member member);

    @Delete("""
            delete 
            from member
            where id = #{id}
            """)
    void deleteMember(Integer id);

    @Update("""
            update member
            set email = #{email}, password = #{password}, nick_name = #{nickName}
            where id = #{id}
            """)
    void updateMember(Member member);

    @Select("""
            select count(*)
            from member
            where email = #{email}
            """)
    int emailChk(String email);

    @Select(
            """
            select *
            from member
            where email = #{email}
            """
    )
    Member selectByEmail(String email);
}
