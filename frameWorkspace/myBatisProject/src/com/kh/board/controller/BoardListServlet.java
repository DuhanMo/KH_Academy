package com.kh.board.controller;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.service.BoardServiceImpl;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;
import com.kh.common.Pagination;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

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

        // Pagination의 getPageInfo 메소드로 currentPage, listCount 전달 후 PageInfo 객체 리턴
        PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

        // 페이징 처리된 게시판 리스트 조회
        ArrayList<Board> list = bService.selectBoardList(pi);

        request.setAttribute("pi",pi);
        request.setAttribute("list",list);

        request.getRequestDispatcher("WEB-INF/views/board/boardListView.jsp").forward(request,response);
    }
}
