package com.kh.corePractice04_javaConfig;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

// 현재 이 클래스를 스프링빈으로 등록
// Bean으로 생성 시 고유한 이름을 지정할 수 있다.
@Component("bookDao")
public class BookDaoImpl implements BookDao {

	private Map<Integer, Book> bookList;
	
	public BookDaoImpl() {
		bookList = new HashMap<>();
		bookList.put(1, new Book(1,12345,"자바의석","남궁성","도우출판",new Date()));
		bookList.put(2, new Book(1,12345,"수학의석","홍성대","홍출판",new Date()));
		bookList.put(3, new Book(1,56789,"칭찬은고래도춤추게한다","고래","홍대클럽",new Date()));
	}
	// 도서 목록 전체를 리스트 형태로 리턴
	@Override
	public List<Book> selectBookList() {
		return new ArrayList<Book>(bookList.values());
	}
	// 도서번호에 해당하는 Book 타입의 객체리턴
	@Override
	public Book selectOneBook(int bookSequence) {
		return bookList.get(bookSequence);
	}

}
