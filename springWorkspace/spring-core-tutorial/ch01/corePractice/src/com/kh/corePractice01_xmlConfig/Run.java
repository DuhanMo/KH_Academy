package com.kh.corePractice01_xmlConfig;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Run {
	public static void main(String[] args) {
		ApplicationContext context =
				new GenericXmlApplicationContext("com/kh/corePractice01_xmlConfig/appConfig.xml");
		
		Member member = (Member)context.getBean("member");
		System.out.println(member);
		member.setMemberSequence(2);
		
		Member member2 = context.getBean("member", Member.class);
		System.out.println(member2);
		Member member3 = context.getBean(Member.class);
		System.out.println(member3);	
		
		
		
		
		System.out.println(member.hashCode());
		System.out.println(member2.hashCode());
		System.out.println(member3.hashCode());
	}
}
