package com.kh.univ.member.controller;

import java.io.UnsupportedEncodingException;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.univ.member.model.service.MemberService;
import com.kh.univ.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	
	// 암호화 처리 
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value="login.do",method=RequestMethod.POST) 
	public String memberLogin(Member m,Model model) {          
//		logger.debug("memberLogin 호출됨"+m);
//		if (logger.isDebugEnabled()) { // logger속성에 level value="debug"일때 실행한다.
//			logger.debug("memberLogin 호출됨"+m);
//		}
		
		// 로그인  처리
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "로그인실패!");
			return "common/errorPage";
		}
	}

}





