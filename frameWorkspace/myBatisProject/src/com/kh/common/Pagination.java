package com.kh.common;

import com.kh.board.model.vo.PageInfo;

public class Pagination {
    public static PageInfo getPageInfo(int currentPage, int listCount){
        // 페이지 정보를 담아줄 PageInfo 참조변수 선언
        PageInfo pi = null;

        // currentPage와 listCount는 이미 넘어온 상태이므로
        // 페이징 처리에 필요한 나머지 변수만 선언
        int pageLimit = 10; // 한 페이지에서 보여질 페이징 수
        int maxPage;        // 전체 페이징 수 중 가장 마지막 페이지
        int startPage;      // 현재 페이지에서 보여질 페이징 버튼의 시작 페이지
        int endPage;        // 현재 페이지에서 보여질 페이징 버튼의 끝 페이지

        int boardLimit = 5; // 한 페이지에 보여질 게시글 갯수

        maxPage = (int)Math.ceil((double)listCount/boardLimit);
        //                                      123/10 --> 12.3 -->  13 (올림처리)

        startPage = (currentPage-1)/pageLimit * pageLimit + 1;
        // currentPage 가 만약에 7이라면
        // 계산을 진행할 때(7-1)/10 * 10 +1
        //              6/10    * 10 + 1 산술식의 우선순위로 오른쪽으로 계산이 진행된다.
        //                [0.6(자료형이 int형이므로 소수점 이하는 버림 처리하게 된다.) --> 0.6이 아니라 0이 된다] * 10 +1
        //                                          0 * 10 + 1 -> 결과가 1이된다.
        endPage = startPage + pageLimit -1;

        if(maxPage < endPage){
            endPage = maxPage;
        }
        pi = new PageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
        return pi;
    }
}
