package com.kh.univ.navi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NaviController {
	@RequestMapping("enrollClassPage.do")
	public String enrollClassPage() {
		return "courseManage/enrollClassPage2";
	}
	
	@RequestMapping("ajaxTest.do")
	public String ajaxText() {
		return "courseManage/newTest";
	}

}
