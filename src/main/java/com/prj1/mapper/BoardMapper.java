package com.prj1.mapper;

import com.prj1.domain.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Insert("""
            insert into board(title,content,writer)
            values (#{title}, #{content}, #{writer})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(Board board);


    @Select("""
            select *
            from board
            where id = #{id}
            """)
    Board selectOne(Integer id);

    @Select("""
            select *
            from board
            order by id desc
            """)
    List<Board> list();

    @Update("""
            update board
            set title = #{title}, content = #{content}, writer = #{writer}
            where id = #{id}
            """)
    void updateBoard(Board board);
}
