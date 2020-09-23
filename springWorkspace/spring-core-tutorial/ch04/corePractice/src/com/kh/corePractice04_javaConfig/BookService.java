package com.kh.corePractice04_javaConfig;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// 여기도 역시나 스프링 빈으로 등록 
// 이름을 설정하지 않으면 클래스 이름의 앞글자를 소문자로 한 네이밍 규칙으로 빈이 생성된다.
@Component
public class BookService {
	// 필드 주입 
	@Autowired
	private BookDao bookDao;
	
	public BookService() {
	}
	
	// 도서 정보 전체 조회용 메소드
	public List<Book> selectAllBooks(){
		return bookDao.selectBookList();
	}
	// 도서번호로 도서 검색용 메소드
	public Book searchBookSequence(int bookSequence) {
		return bookDao.selectOneBook(bookSequence);
	}
}
