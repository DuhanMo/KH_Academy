package com.kh.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession; // root-context에서 작성한 bean으로 생성되어 주입된다.
	
	
	public Member loginMember(Member m) {
		return (Member) sqlSession.selectOne("memberMapper.loginMember",m);
	}


	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

}
