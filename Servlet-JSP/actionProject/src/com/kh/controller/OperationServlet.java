package com.kh.controller;

import com.kh.model.vo.Person;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/elOperation.do")
public class OperationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("sOne", "안녕");
        request.setAttribute("sTwo", "안녕");

        request.setAttribute("pOne", new Person("홍길동",20,'남'));
        request.setAttribute("pTwo", new Person("홍길동",20,'남'));

        request.setAttribute("big", 10);
        request.setAttribute("small", 3);

        Person p = null;
        request.setAttribute("p", p);

        ArrayList<String> list = new ArrayList<>();
        list.add("반가워요");
        request.setAttribute("list", list);

        request.getRequestDispatcher("views/01_el/02_elOperation.jsp").forward(request,response);

    }
}
