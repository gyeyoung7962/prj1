package com.prj1.service;


import com.prj1.domain.Board;
import com.prj1.domain.CustomUser;
import com.prj1.domain.Member;
import com.prj1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
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

    public void add(Board board, Authentication authentication) {

        System.out.println("service add");
        System.out.println("사용자정보:" + authentication.getPrincipal());

        Object principal = authentication.getPrincipal();
        if(principal instanceof CustomUser user){
            Member member = user.getMember();
            board.setMemberId(member.getId());
        }
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
                                            "nextPageNumber", nextPageNumber,
                                            "totalCount", numberOfBoard
                                            )
                        );
    }

    public void boardUpdate(Board board) {

        mapper.updateBoard(board);
    }

    public void deleteBoard(Integer id) {

        mapper.deleteBoard(id);
    }

    public boolean hasAccess(Integer id, Authentication authentication) {

        if(authentication == null){
            return false;
        }

        Board board = mapper.selectOne(id); //게시글의 정보를 가져옴

        Object principal = authentication.getPrincipal(); //사용자정보를 principal에 담기
        if(principal instanceof CustomUser user){ // CustomUser에 타입이면
            Member member = user.getMember();  //CustomUser에서 변수로 지정한 Mmeber변수의 정보를 생성할때 입력받았으므로 member변수에는 사용자정보가 있고 그걸 토대로 Member변수에 넣는다


            return board.getMemberId().equals(member.getId()); // 게시글의 아이디와 맴버의 아이디값이 같으면 true를 리턴
        }

        return false;
    }
}
