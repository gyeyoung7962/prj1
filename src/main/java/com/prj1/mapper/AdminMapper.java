package com.prj1.mapper;


import com.prj1.domain.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AdminMapper {



    @Select("""
            select *
            from member
            order by id desc
            """)
    List<Member> memberList();

}
