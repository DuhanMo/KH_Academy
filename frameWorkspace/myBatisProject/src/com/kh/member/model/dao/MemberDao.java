package com.kh.member.model.dao;

import com.kh.member.model.vo.Member;
import org.apache.ibatis.session.SqlSession;

public class MemberDao {
    public Member selectMember(SqlSession session, Member mem) {
        // 리턴용 멤버 객체 선언
        Member loginUser = null;
        // 보통이면 여기서부터 preparedStatement를 작성을 했음
        // 하지만 이 프로젝트에서는 마이바티스를 적용했기 때문에 sqlSession이 제공하는 메소드를 통해서 sql문을 실행 시킨다.

        // 객체 한개를 조회할 때는 SqlSession의 selectOne()메소드를 사용한다.
        // 메소드 사용 시 전달인자로 2개의 값을 넘기게 되는데
        // 첫번째 인자로 쿼리문이 존재하는 '매퍼의 네임스페이스.쿼리문아이디'
        // 두번째 인자로 쿼리문을 완성시킬 '객체'이다.

        loginUser = session.selectOne("memberMapper.loginMember",mem);
        System.out.println("loginUser" + loginUser);
        return loginUser;
    }

    public int insertMember(SqlSession session, Member mem) {
        int result = session.insert("memberMapper.insertMember",mem);
        return result;
    }
}
