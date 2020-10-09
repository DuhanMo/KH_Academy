package com.kh.univ.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.univ.model.vo.User;
@Controller
public class TestController {

	/**
	 * 1. ServletOutputStream을 이용한 방식 
	 * @param name
	 * @param age
	 * @param response
	 * @throws IOException 
	 */
//	@RequestMapping("test1.do")
//	public void test1Method(String name, int age, HttpServletResponse response) throws IOException{
//		PrintWriter out = response.getWriter();
//		
//		if (name.equals("신사임당")&& age==47) {
//			out.print("ok");
//		} else {
//			out.print("fail");
//		}
//	}
	/**
	 * 2.@ResponseBody를 이용한 방
	 * 반환형이 String 일 경우 뷰명 반환
	 * 하지만 @ResponseBody가 붙으면 String 반환은 해당 요청을 보낸 뷰에 전달할 데이터로 변환 
	 * @param name
	 * @param age
	 * @return
	 */
	@ResponseBody // 결과를 response 객체에 담아서 보내주세요 
	@RequestMapping("test1.do")
	public String test1Method(String name, int age) {
		
		if (name.equals("신사임당")&& age==47) {
			return "ok";
		} else {
			return "fail";
		}
	}
	/**
	 * 3. @ResponseBody를 사용 + produces = "application/json;charset=utf-8" 사용
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@ResponseBody
	@RequestMapping(value = "test2.do", produces = "application/json;charset=utf-8")
	public String test2Method() throws UnsupportedEncodingException {
		// DB에서 조회해온 결과를 가져왓다고 가정하고 User 객체를 하나 생성
		User user = new User("user01","pass01","홍길동",20,"user01@test.com","01012345678");
		
		
		// @ResponseBody 어노테이션을 추가하게 되면 이하의 코드를 생략해도된다.
		// 다만 charset은 별도로 수정해주어야한다.
		//response.setContentType("application/json; charset=UTF-8");
		
		// JSON 객체에 담아서 보내주기 
		JSONObject job = new JSONObject(); //JSON 사용을 위해 pom.xml 에 넣은 json.simple library를 추가했기 때문 .
		// 전달해주는 시점에 string 형식 utf-8
		job.put("userId",user.getUserId());
		job.put("userPwd",user.getUserPwd());
		job.put("userName",user.getUserName());
		job.put("age",user.getAge());
		job.put("email",user.getEmail());
		job.put("phone",user.getPhone());
		
//		return job;//반환형이 String 이 아니어서 에러 
		return job.toJSONString();
	}
	/**
	 * 4. @ResponseBody를 쓰지않고 json 객체 보내기 
	 * @return
	 * @throws IOException 
	 * @throws UnsupportedEncodingException
	 */
	
//	@RequestMapping("test2.do")
//	public void test2Method(HttpServletResponse response) throws IOException  {
//		// DB에서 조회해온 결과를 가져왓다고 가정하고 User 객체를 하나 생성
//		User user = new User("user01","pass01","홍길동",20,"user01@test.com","01012345678");
//		
//		
//		// @ResponseBody 어노테이션을 추가하게 되면 이하의 코드를 생략해도된다.
//		// 다만 charset은 별도로 수정해주어야한다.
//		response.setContentType("application/json; charset=UTF-8");
//		
//		// JSON 객체에 담아서 보내주기 
//		JSONObject job = new JSONObject(); //JSON 사용을 위해 pom.xml 에 넣은 json.simple library를 추가했기 때문 .
//		// 전달해주는 시점에 string 형식 utf-8
//		job.put("userId",user.getUserId());
//		job.put("userPwd",user.getUserPwd());
//		job.put("userName",user.getUserName());
//		job.put("age",user.getAge());
//		job.put("email",user.getEmail());
//		job.put("phone",user.getPhone());
//		
//		PrintWriter out = response.getWriter();
//		out.print(job);
//	}

}







