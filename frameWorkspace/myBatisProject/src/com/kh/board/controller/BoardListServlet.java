package com.kh.board.controller;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.service.BoardServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/list.bo")
public class BoardListServlet extends HttpServlet {
    private static final long serialVersionUID = 8021553951312451154L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardService bService = new BoardServiceImpl();
        int currentPage = 1;

        if(request.getParameter("currentPage") != null){
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        int listCount = bService.getListCount();
    }
}
