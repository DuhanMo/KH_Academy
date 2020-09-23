package com.kh.corePractice03_xmlConfig;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Run {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext(
				"com/kh/corePractice03_xmlConfig/configuration/appConfig.xml");

		Member member = context.getBean("memberGenerator", Member.class);
		Account acc = (PersonalAccount) context.getBean("accountGenerator");

		System.out.println(member);
		System.out.println(acc);
		System.out.println(member.getPersonalAccount().getBalance());
		System.out.println(member.getPersonalAccount().deposit(1000000));
		System.out.println(member.getPersonalAccount().getBalance());
		System.out.println(member.getPersonalAccount().withDraw(500000));
		System.out.println(member.getPersonalAccount().getBalance());
	}
}
