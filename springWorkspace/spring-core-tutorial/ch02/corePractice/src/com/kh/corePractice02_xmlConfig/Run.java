package com.kh.corePractice02_xmlConfig;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Run {
	public static void main(String[] args) {
		ApplicationContext context = 
				new GenericXmlApplicationContext("com/kh/corePractice02_xmlConfig/configuration/appConfig.xml");
		
		MemberDao memberDao = context.getBean(MemberDao.class);
		
		System.out.println(memberDao.selectMember(1));
		System.out.println(memberDao.insertMember(new Member(3,"user03","pass03","새로운멤버")));
		System.out.println(memberDao.selectMember(3));
		
	}
}
