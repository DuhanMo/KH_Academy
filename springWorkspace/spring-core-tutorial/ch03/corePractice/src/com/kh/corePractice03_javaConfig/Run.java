package com.kh.corePractice03_javaConfig;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Run {

	public static void main(String[] args) {

		ApplicationContext context =
				new AnnotationConfigApplicationContext("com.kh.corePractice03_javaConfig");
		
		// @Bean 어노테이션에 별다른 이름을 지정하지 않으면 메소드명이 Bean의 이름이 된다.
		// byName으로 bean을 가져올 때는 반환형이 Object를 리턴하기 때문에 다운캐스팅 해야 한다.
//		Member member = context.getBean("memberGenerator",Member.class);
//		Member member = (Member)context.getBean("memberGenerator");
		Member member = context.getBean("memberGenerator",Member.class);
		Member member2 = context.getBean("memberGenerator2",Member.class);
		
		
		System.out.println(member);
		System.out.println(member.getPersonalAccount().getBalance());
		System.out.println(member.getPersonalAccount().deposit(1000000));
		System.out.println(member.getPersonalAccount().getBalance());
		System.out.println(member.getPersonalAccount().withDraw(500000));
		System.out.println(member.getPersonalAccount().getBalance());
		
		System.out.println(member2);
		System.out.println(member2.getPersonalAccount().getBalance());
		System.out.println(member2.getPersonalAccount().deposit(3300000));
		System.out.println(member2.getPersonalAccount().getBalance());
		System.out.println(member2.getPersonalAccount().withDraw(1300000));
		System.out.println(member2.getPersonalAccount().getBalance());
		
	}

}
