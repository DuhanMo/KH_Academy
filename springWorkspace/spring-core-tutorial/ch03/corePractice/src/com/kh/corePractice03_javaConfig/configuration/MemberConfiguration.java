package com.kh.corePractice03_javaConfig.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.kh.corePractice03_javaConfig.Account;
import com.kh.corePractice03_javaConfig.Member;
import com.kh.corePractice03_javaConfig.PersonalAccount;

// 이 파일이 스프링 설정파일임을 알려준다.
@Configuration
public class MemberConfiguration {
	@Bean
	public Account accountGenerator() {
		return new PersonalAccount(20,"110-123-5678","1234");
	}
	@Bean
	public Member memberGenerator() {
		return new Member(1,"홍길동", "010-2400-2811", "hong123@gmail.com", accountGenerator());
	}
	
	
}
