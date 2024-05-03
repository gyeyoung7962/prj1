package com.prj1.mapper;

import com.prj1.domain.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Insert("""
            insert into board(title,content,member_id)
            values (#{title}, #{content}, #{memberId})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(Board board);


    @Select("""
            select b.id, b.title, b.content, b.regDate, m.nick_name writer, m.id as member_id
            from board b join member m
            on b.member_id = m.id
            where b.id = #{id}
            """)
    Board selectOne(Integer id);

    @Select("""
            select b.id, b.title, m.nick_name writer,b.regDate
            from board b join member m
            on b.member_id = m.id
            order by id desc
            limit #{offset},10
            """)
    List<Board> list(Integer offset);

    @Delete("""
            delete from
            board where id = #{id}
            """)
    void deleteBoard(Integer id);


    @Update("""
            update board
            set title=#{title}, content = #{content}
            where id = #{id}
""")
    void updateBoard(Board board);

    @Select("""
            select count(*)
            from board
            """)
    int totalCount();

    @Delete("""
            delete
            from board
            where member_id = #{id}
            """)
    void deleteBoardByMemberId(Integer id);
}
