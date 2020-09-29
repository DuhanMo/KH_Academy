package com.kh.spring.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.BoardDao;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bDao;
	
	@Override
	public int getListCount() {
		return bDao.getListCount();
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(pi);
	}

	@Override
	public Board selectBoard(int bId) {
		int result = bDao.updateCount(bId);
		System.out.println(result);
		
		if(result>0) {
			return bDao.selectBoard(bId);
		}else{
			return null;
			
		}
	}

}
