package com.kh.board.controller;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.service.BoardServiceImpl;
import com.kh.board.model.vo.Board;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/detail.bo")
public class BoardDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bId = Integer.parseInt(request.getParameter("bId"));

        BoardService bService = new BoardServiceImpl();

        Board b = bService.selectBoardDetail(bId);

        request.setAttribute("rCount",b.getReplyList().size());
        request.setAttribute("b",b);
        request.getRequestDispatcher("WEB-INF/views/board/boardDetailView.jsp").forward(request,response);


    }
}
