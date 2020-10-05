package com.kh.clone.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.clone.member.model.service.MemberService;
import com.kh.clone.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	//암호화처리 
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/**
	 * 로그인 처리 
	 * @param m
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";
		}
		else{
			model.addAttribute("msg","로그인실패!");
			return null;
		}
		
	}
	/**
	 * 로그아웃용 컨트롤러
	 * Status를 이용해 객체를 없앤다.
	 * @param status
	 * @return
	 */
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "redirect:home.do";
	}
	/**
	 * 회원가입버튼을 누르면 컨트롤러를 한번 거쳐 memberInsertForm 로 간다.
	 * @return
	 */
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "member/memberInsertForm";
	}
	/**
	 * 회원가입 컨트롤러.
	 * 회원가입페이지에서 form action 으로 오는 곳
	 * @param m
	 * @param model
	 * @param post
	 * @param address1
	 * @param address2
	 * @return
	 */
	@RequestMapping("minsert.do")
	public String insertMember(
			Member m, Model model,
			@RequestParam("post") String post,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2
			) {
		if (!post.equals("")) {
			m.setAddress(post+","+address1+","+address2);
		}
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		System.out.println(encPwd);
		m.setPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if (result >0) {
			return "redirect:home.do";
		}else {
			model.addAttribute("msg","회원 가입에 실패하였습니다.!");
			return "common/errorPage";
		}
		
	}
}
