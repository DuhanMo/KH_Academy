package com.kh.univ.navi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NaviController {
	@RequestMapping("enrollClassPage.do")
	public String enrollClassPage() {
		return "enrollClass/enrollClassPage";
	}
	
	@RequestMapping("ajaxTest.do")
	public String ajaxText() {
		return "enrollClass/ajaxTest";
	}

}
