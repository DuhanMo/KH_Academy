package com.kh.controller;

import com.kh.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String userName = request.getParameter("userName");

        User usr = new User();
        User.setUserId(userId);
        User.setUserPwd(userPwd);
        User.setUserName(userName);

        Member loginUser = new UserDao().loginCheck(usr);

        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", loginUser);

            response.sendRedirect(request.getContextPath());
        } else {
            request.setAttribute("msg", "로그인 실패");
            RequestDispatcher error = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
            error.forward(request, response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
    ServletException, IOException {

    }
}
