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
    public ArrayList<Board> selectBoardList(PageInfo pl) {
        return null;
    }
}
