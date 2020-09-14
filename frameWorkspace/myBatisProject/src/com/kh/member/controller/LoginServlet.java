package com.kh.member.controller;

import com.kh.member.model.service.MemberServiceImpl;
import com.kh.member.model.vo.Member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String userPwd= request.getParameter("userPwd");
        System.out.println(userId + " : " + userPwd);

        Member mem = new Member();
        mem.setUserId(userId);
        mem.setUserPwd(userPwd);

        // 결속성을 낮추기 위해
//        Member loginUser = new MemberService().selectMember(mem);
        Member loginUser = new MemberServiceImpl().selectMember(mem);
        if(loginUser != null){
            HttpSession session = request.getSession();
            session.setAttribute("loginUser",loginUser);
            response.sendRedirect(request.getContextPath());
        }else {
            request.setAttribute("msg","로그인실패");
            RequestDispatcher error = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
            error.forward(request,response);
        }
    }
}
