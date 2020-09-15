package com.kh.board.model.service;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;

import java.util.ArrayList;

public interface BoardService {
    // 1_1. 게시판 목록 수 조회용 메소드
    int getListCount();

    // 1_2. 페이징 처리된 게시판 목록 조회용 메소드
    ArrayList<Board> selectBoardList(PageInfo pl);
}
