package com.kh.univ.navi.controller;

import java.io.UnsupportedEncodingException;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.univ.member.model.vo.Member;

@Controller
public class NaviController {
	@RequestMapping("enrollClassPage.do")
	public String enrollClassPage() {
		return "enrollClassPage";
	}
	
	@RequestMapping("ajaxTest.do")
	public String ajaxText() {
		return "ajaxTest";
	}

}
