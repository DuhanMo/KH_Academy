package com.kh.board.model.dao;

import org.apache.ibatis.session.SqlSession;

public class BoardDao {
    public int getListCount(SqlSession session) {
        // 조회된 게시판 총 갯수를 담을 변수 선언하고 값 받기
        int listCount = session.selectOne(("boardMapper.selectListCount"));
        System.out.println(listCount);
        return listCount;
    }
}
