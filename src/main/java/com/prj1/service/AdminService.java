package com.prj1.service;


import com.prj1.domain.Member;
import com.prj1.mapper.AdminMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminService {

    private final AdminMapper mapper;

    public List<Member> memberList() {

        return mapper.memberList();
    }
}
