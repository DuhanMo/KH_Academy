package com.kh.member.model.service;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import org.apache.ibatis.session.SqlSession;

public class MemberServiceImpl implements MemberService {
    // MemberService를 실체화(implements)하게 된다면
    // MemberService인터페이스에 있는 추상 메소드를 여기서 구현시켜줘야 한다.

    // MemberDao메소드를 호출하기 위한 참조변수 선언 및 생성
    private MemberDao mDao = new MemberDao();

    @Override
    public Member selectMember(Member mem) {

        // Connection 객체를 우선 생성해야함.
        // 마이바티스에서는 Connection 객체 대신에 SqlSession이라는 객체를 생성해서 사용.
        SqlSession session = getSqlSession();


        return null;
    }
}
