package com.kh.board.controller;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.service.BoardServiceImpl;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;
import com.kh.board.model.vo.SearchCondition;
import com.kh.common.Pagination;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/search.bo")
// currentPage=2c&ondition=title&search=번
public class BoardSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition"); // title
        String search = request.getParameter("search"); // 번

        // 검색 조건을 저장하기 위한 클래스 작성 및 객체 생성
        SearchCondition sc = new SearchCondition();

        // 전달받은 searchCondition에 해당하는 파라미터에 따라 setter를 이용하여 value값을 적용
        if(condition.equals("writer")) {
            sc.setWriter(search);
        }else if(condition.equals("title")) {
            sc.setTitle(search);
        }else if(condition.equals("content")) {
            sc.setContent(search);
        }

        // 게시판 목록 조회와 동일한 페이징 처리를 하자
        int currentPage = 1;
        if(request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

        BoardService bService = new BoardServiceImpl();

        // 검색 결과에 해당되는 게시물 갯수 조회
        int listCount = bService.getSearchResultListCount(sc);

        // 페이지 정보가 담겨있는 PageInfo를 받기 위해 Pagination static 메소드를 호출
        PageInfo pi = Pagination.getPageInfo(currentPage,listCount);

        // 검색결과에 해당되는 게시물 목록들 조회
        ArrayList<Board> list = bService.selectSearchResultList(sc,pi);

        request.setAttribute("list",list);
        request.setAttribute("pi",pi);

        request.setAttribute("sc",sc);
        request.setAttribute("condition",condition);
        request.setAttribute("search",search);

        request.getRequestDispatcher("WEB-INF/views/board/boardListView.jsp").forward(request,response);

    }

}
