package com.kh.univ.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.univ.member.model.dao.MemberDao;
import com.kh.univ.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao mDao;
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(m);
	}

}
