package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;

public interface BoardService {
	
	// 1. 게시판 전체 리스트 조회
	
	/**
	 * 1_1. 게시판 총 갯수 조회
	 * @return
	 */
	int getListCount();
	
	/**
	 * 1_2. 게시판 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Board> selectList(PageInfo pi);

	/**
	 * 2. 게시판 상세조회 
	 * @param bId
	 * @return
	 */
	Board selectBoard(int bId);

	/**
	 * 3. 게시판 작성 
	 * @param b
	 * @return
	 */
	int insertBoard(Board b);

	/**
	 * 4. 게시판 수정 
	 * @param bId
	 * @return
	 */
	Board selectUpdateBoard(int bId);
	int updateBoard(Board b);
	
}