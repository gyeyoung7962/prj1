package com.prj1.service;

import com.prj1.domain.Member;
import com.prj1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberMapper mapper;


    public void insertMember(Member member) {

        mapper.insertMember(member);
    }

    public List<Member> memberList() {

        return mapper.memberList();
    }
}
