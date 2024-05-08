package com.prj1.domain;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.List;

@Getter
public class CustomUser extends User {

    private Member member; //회원정보를 담을 변수

    public CustomUser(Member member){ //회원을 변수로 받는 Customer생성자


        //User를 상속받으므로 부모생성자를 호출
        //회원의 이메일, 비밀번호, 권한을 토대로 User생성자 생성
        //member.getAuthority().stream().map(SimpleGrantedAuthority::new).toList()
        //-> 컬렉션타입이 list인 회원의 권한을 받아와 스트림으로 변환하여 SimpleGrantedAuthority객체에 매핑하여 권한을 담고 매핑시킨 권한목록을 반환
        super(member.getEmail(), member.getPassword(), member.getAuthority().stream().map(SimpleGrantedAuthority::new).toList());

        //필요한 회원정보를 뽑아오기 위해 member변수에 정보를 담는다
        this.member = member;
    }

    
}
