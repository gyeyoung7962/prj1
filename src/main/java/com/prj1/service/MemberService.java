package com.prj1.service;

import com.prj1.domain.CustomUser;
import com.prj1.domain.Member;
import com.prj1.mapper.BoardMapper;
import com.prj1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
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


    //admin인지 확인하는 매서드
    public boolean isAdmin(Authentication authentication) {  //시큐리티로 부터 회원정보가 담긴 매개변수를 받는다

        Object principal = authentication.getPrincipal(); //회원에대한 정보를 담아서 principal에 담는다
        if(principal instanceof CustomUser user){ // 담긴정보가 CustomerUser 타입이면

            //user의 권한을 스트림으로 변환해서 GrantedAuthority인터페이스의 getAuthority메서드에 권한을 바인딩시키고
            //바인딩된 권한에서 admin이 존재하는지 확인후 반환한다
            return user.getAuthorities().stream().map(GrantedAuthority::getAuthority).anyMatch(s->s.equals("admin"));
        }
        return false;
    }
}
