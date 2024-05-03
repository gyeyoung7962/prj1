package com.prj1.service;


import com.prj1.domain.Board;
import com.prj1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Objects;

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

    public Map<String, Object> boardList(Integer page) {

        int offset = (page -1) *10;

        int perPageNum = 10;

        //총 글의 개수
        int numberOfBoard = mapper.totalCount();

        //106 -1 / 10 +1 =11
        //100 -1 / 10 +1 = 10
        //마지막 페이지 번호
        int lastPageNumber = (numberOfBoard -1)/perPageNum +1;

        //5페이지 10 5/10 * 10  13p
        int currentEndPage = (page -1)/perPageNum * perPageNum + perPageNum;
        int currentStartPage = currentEndPage - (perPageNum-1);


        //50 20
        currentEndPage = Math.min(currentEndPage, lastPageNumber);

        int prevPageNumber = currentStartPage - perPageNum;
        int nextPageNumber = currentStartPage + perPageNum;

        return Map.of("list",mapper.list(offset),
                        "pageInfo", Map.of(
                                            "lastPageNumber", lastPageNumber,
                                            "currentPage", page,
                                            "currentEndPage", currentEndPage,
                                            "currentStartPage", currentStartPage,
                                            "prevPageNumber", prevPageNumber,
                                            "nextPageNumber", nextPageNumber
                                            )
                        );
    }

    public void boardUpdate(Board board) {

        mapper.updateBoard(board);
    }

    public void deleteBoard(Integer id) {

        mapper.deleteBoard(id);
    }
}
