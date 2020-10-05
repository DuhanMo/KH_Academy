package com.kh.clone.member.model.service;

import com.kh.clone.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);

	int insertMember(Member m);
	
}
