package com.kh.univ.test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.univ.test.model.service.TestService;
import com.kh.univ.test.model.vo.Test;

@Controller
public class TestController {
	@Autowired
	private TestService tService;
 @RequestMapping("test1.do")
	public void selectList(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<Test> list = tService.selectList();
		System.out.println(list);
		// Gson도 날짜에 대해서는 날짜포맷을 변경시켜줘야한다.
		// Gson객체의 속성값을 변경하고자 하면 GsonBuilder()를 통해서 변경을 한다.
//		Gson gson = new GsonBuilder().create();
//		gson.toJson(list,response.getWriter());
	}
}
