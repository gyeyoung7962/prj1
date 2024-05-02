package com.prj1.mapper;


import com.prj1.domain.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {


    @Insert("""
            insert into member(email, password, nick_name)
            values(#{email}, #{password}, #{nick_name})
            
            """)
    void insertMember(Member member);
}
