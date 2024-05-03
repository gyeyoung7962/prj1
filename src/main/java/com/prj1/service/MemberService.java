package com.prj1.service;

import com.prj1.domain.CustomUser;
import com.prj1.domain.Member;
import com.prj1.mapper.BoardMapper;
import com.prj1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberMapper mapper;
    private final BoardMapper boardMapper;
    private final BCryptPasswordEncoder encoder;


    public void insertMember(Member member) {

        String password = member.getPassword();
        String encodedPassword = encoder.encode(password);

        member.setPassword(encodedPassword);

        mapper.insertMember(member);
    }

    public List<Member> memberList() {

        return mapper.memberList();
    }

    public Member infoMember(Integer id) {

        return mapper.infoMember(id);
    }

//    public Member loginMember(Member member) {
//        return mapper.loginMember(member);
//    }

    public void deleteMember(Integer id) {

        //board 테이블에서 레코드 삭제
        boardMapper.deleteBoardByMemberId(id);

        //member 테이블에서 레코드 삭제
        mapper.deleteMember(id);
    }

    public void updateMember(Member member) {

        if(member.getPassword() != null && member.getPassword().length() >0){
            member.setPassword(encoder.encode(member.getPassword()));
        }
        else{
            Member old = mapper.infoMember(member.getId());
            member.setPassword(old.getPassword());
        }

        mapper.updateMember(member);
    }

    public int emailChk(String email) {

        return mapper.emailChk(email);
    }

    public void signup(Member member) {

        member.setPassword(encoder.encode(member.getPassword()));
        mapper.insertMember(member);
    }

    public boolean hasAccess(Integer id, Authentication authentication) {

        if(authentication == null){
            return false;
        }
        Object principal = authentication.getPrincipal();
        if(principal instanceof CustomUser user){
            Member member = user.getMember();
            return member.getId().equals(id);
        }
        return false;
    }
}
