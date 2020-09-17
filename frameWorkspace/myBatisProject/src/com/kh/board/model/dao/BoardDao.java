package com.kh.board.model.dao;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;
import com.kh.board.model.vo.SearchCondition;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;

public class BoardDao {
    public int getListCount(SqlSession session) {
        // 조회된 게시판 총 갯수를 담을 변수 선언하고 값 받기
        int listCount = session.selectOne(("boardMapper.selectListCount"));
        System.out.println(listCount);
        return listCount;
    }

    public ArrayList<Board> selectBoardList(SqlSession session, PageInfo pi) {
        // 게시글 목록을 담을 변수 선언
        ArrayList<Board> list = null;

        // JSP/Servlet에서는 쿼리문에서 RowNum 조건을 통해서 조회했었다.
        // 하지만 마이바티스에서는 페이징 처리를 위해 RowBounds라는 클래스를 제공하고있다.
        // RowBounds -> offset 과 limit값을 넘겨 받아 페이징 처리를 쉽게 구현해주는 객체

        // * offset - 몇 개의 게시글을 건너 뛰고 조회를 할 지에 대해서 계산
        int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        //                  1            -1:0  *  5   = 0;
        //                  2페이지클릭     -1:1  *  5   = 5  // 다섯개를 건너뛰고 5~10개를 가져온다.
        //                  3페이지클릭     -1:2  *  5   =10  // 10개부터 리미트개수까지   15
        RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());

        // 리스트를 조회 하기 위해 session의 selectList() 메소드를 사용
        // 메소드 사용 시 전달 인자로 3개의 값을 넘기게 된다.
        // 첫번째 인자는 쿼리문이 존재하는 '매퍼의 네임스페이스.쿼리문아이디'
        // 두번째 인자는 조회시 필요한 데이터
        // 세펀째 인자는 RowBounds 객체를 전달한다.
        list = new ArrayList<Board>(session.selectList("boardMapper.selectBoardList",null,rowBounds));


        return list;
    }

    public int updateCount(SqlSession session, int bId){
        int result = session.update("boardMapper.updateBoardCount",bId);
        System.out.println(result);
        return result;
    }

    public Board selectBoardDetail(SqlSession session, int bId) {
        // bId에 해당하는 게시글을 조회해 오는데 이 때 그 해당 게시글에 달려있는 댓글도 다 조회하자
        Board b = session.selectOne("boardMapper.selectBoardDetail",bId);
        return b;
    }

    public int getSearchResultListCount(SqlSession session, SearchCondition sc) {
        int listCount = session.selectOne("boardMapper.selectSearchResultCount",sc);
        System.out.println("listCount : " + listCount);
        return listCount;
    }

    public ArrayList<Board> selectSearchResultList(SqlSession session, SearchCondition sc, PageInfo pi) {
        ArrayList<Board> list = null;

        int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();

        RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());

        list = new ArrayList<Board>(session.selectList("boardMapper.selectSearchResultList", sc, rowBounds));
        return list;
    }
}
