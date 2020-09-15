package com.kh.member.model.service;

import static com.kh.common.Template.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberServiceImpl implements MemberService {
    // MemberService를 실체화(implements)하게되면
    // MemberService 인터페이스에 있는 추상메소드를 여기서 구현시켜줘야한다.

    // MemberDao메소드를 호출하기 위한 참조변수 선언 및 생성
    private MemberDao mDao = new MemberDao();

    @Override
    public Member selectMember(Member mem) {

        // Connection 객체를 우선 생성해야하는데
        // 마이바티스에서는 Connection 객체 대신에 SqlSession이라는 객체를 생성한다.

        SqlSession session = getSqlSession();

        Member loginUser = mDao.selectMember(session,mem);

        session.close();

        return loginUser;
    }

    @Override
    public int insertMember(Member mem) {

        SqlSession session = getSqlSession();

        int result = mDao.insertMember(session,mem);

        if(result > 0) {
            session.commit();
        }else {
            session.rollback();
        }

        session.close();

        return result;
    }


}