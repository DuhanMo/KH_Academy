package com.kh.clone.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.clone.member.model.dao.MemberDao;
import com.kh.clone.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(m);
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}

}
