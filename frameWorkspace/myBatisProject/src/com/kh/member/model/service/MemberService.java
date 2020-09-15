package com.kh.member.model.service;

import com.kh.member.model.vo.Member;

public interface MemberService {

    // 인터페이스의 모든 메소드는 묵시적으로 public abstract(미완성)

    // 1. 로그인 처리용 서비스
    Member selectMember(Member mem);

    // 2. 회원가입 처리용 서비스
    int insertMember(Member mem);
}