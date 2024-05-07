package com.prj1.service;

import com.prj1.domain.CustomUser;
import com.prj1.domain.Member;
import com.prj1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final MemberMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Member member = mapper.selectByEmail(username);    //사용자의 이메일을 받아 회원정보 조회(username = 넘어온 이메일을 아이디로 했다)
        if(member == null){ //회원정보가 없으면
            throw new UsernameNotFoundException(username); //exception 발생
        }

        List<String> authority = mapper.selectAuthorityByMemberId(member.getId()); //회원 아이디로 권환을 조회하여 리스트에 담는다

        member.setAuthority(authority); //권한을 member에 넣어준다

        return new CustomUser(member); // CustomUser 생성자로 member의 정보를 받아 생성한다
    }
}
