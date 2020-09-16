package com.kh.board.model.service;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;

import static com.kh.common.Template.getSqlSession;

public class BoardServiceImpl implements BoardService {

    private BoardDao bDao = new BoardDao();

    @Override
    public int getListCount() {
        SqlSession session = getSqlSession();

        int listCount = bDao.getListCount(session);

        session.close();
        return listCount;
    }

    @Override
    public ArrayList<Board> selectBoardList(PageInfo pi) {
        SqlSession session = getSqlSession();

        ArrayList<Board> list = bDao.selectBoardList(session, pi);


        session.close();
        return list;
    }

    @Override
    public Board selectBoardDetail(int bId) {
        SqlSession session = getSqlSession();
        // 1. 조회수 증가
        int result = bDao.updateCount(session, bId);
        // 2. 조회수 증가 성공 시 게시글 조회
        Board b = null;
        if(result > 0 ) {
            session.commit();
            b = bDao.selectBoardDetail(session,bId);
        }else{
            session.rollback();
        }
        session.close();

        return b;
    }
}
