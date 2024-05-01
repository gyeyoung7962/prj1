package com.prj1.service;


import com.prj1.domain.Board;
import com.prj1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class BoardService {

    private final BoardMapper mapper;

    public void add(Board board) {

        mapper.insert(board);
    }

    public Board selectBoard(Integer id) {

       return  mapper.selectOne(id);
    }

    public List<Board> boardList() {

        return mapper.list();
    }

    public void boardUpdate(Board board) {

        mapper.updateBoard(board);
    }

    public void deleteBoard(Integer id) {

        mapper.deleteBoard(id);
    }
}
