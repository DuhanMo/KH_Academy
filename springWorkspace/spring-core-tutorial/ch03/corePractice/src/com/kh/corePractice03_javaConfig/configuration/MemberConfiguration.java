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
	public Account accountGenerator2() {
		return new PersonalAccount(199,"900902-01-134747","1234");
	}
	@Bean
	public Member memberGenerator() {
//		return new Member(1,"홍길동", "010-2400-2811", "hong123@gmail.com", accountGenerator());
		
		
		
		// setter를 이용한 의존성 주입
		// 생성자를 통해 Member객체 생성한 것을 setter를 사용하는 방법으로 교체 
		Member member = new Member();
		Account account = accountGenerator();
		
		member.setMemberSequence(1);
		member.setMemberName("홍길동");
		member.setPhone("010-2222-9999");
		member.setEmail("hong@gmail.com");
		member.setPersonalAccount(account);
		
		return member;
		
	}
	@Bean
	public Member memberGenerator2() {
		return new Member(2,"모두한", "010-2420-1111", "momo@gmail.com", accountGenerator2());
	}
	
	
}
