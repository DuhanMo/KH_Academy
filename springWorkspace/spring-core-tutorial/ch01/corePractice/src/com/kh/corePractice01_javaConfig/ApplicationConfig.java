package com.kh.corePractice01_javaConfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

// 이 클래스가 설정 메타정보를 가지고 있다는 의미를 가진 어노테이션을 추가 
// 처음에 스프링컨테이너 생성 시 현재 파일을 먼저 읽어들임.
@Configuration
public class ApplicationConfig {
	
	
	@Bean
	public Member getMember() {
		return new Member(1, "user01", "pass01","홍길동");
	}

}
