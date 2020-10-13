package com.kh.univ.test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.univ.test.model.service.TestService;
import com.kh.univ.test.model.vo.Test;

@Controller
public class TestController {
	@Autowired
	private TestService tService;
	
	@ResponseBody
	@RequestMapping(value = "test1.do", produces = "application/json; charsert=utf-8")
	public void selectList(HttpServletResponse response) throws JsonIOException, IOException {

		ArrayList<Test> list = tService.selectList();
		System.out.println(list);
		Gson gson = new GsonBuilder().create();
	}
	@ResponseBody
	@RequestMapping(value = "test2.do", produces = "application/json; charset=utf-8")
	public String selectList2() throws JsonProcessingException {
		ArrayList<Test> list = tService.selectList();
		System.out.println(list);
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(list);
		System.out.println(jsonStr);
		return jsonStr;
	}
}
