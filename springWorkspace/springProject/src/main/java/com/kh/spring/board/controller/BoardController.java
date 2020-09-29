package com.kh.spring.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.common.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv, 
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		System.out.println(currentPage);
		
		int listCount = bService.getListCount();
		
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("board/boardListView");
		
		return mv;
	}
	
	@RequestMapping("bdetail.do")
	public ModelAndView boardDetail(ModelAndView mv, int bId,
			@RequestParam(value="currentPage",required = false, defaultValue="1") int currentPage) {
		
	 Board b = bService.selectBoard(bId);
	 
	 if (b!=null) {
		 mv.addObject("b",b).addObject("currentPage",currentPage).setViewName("board/boardDetailView");
		 
		
	}else {
		mv.addObject("msg","게시글 상세조회 실패 ").setViewName("common/errorPage");
	}
		return mv;
	}
			
	@RequestMapping("binsertView.do")
	public String boardInsertView() {
		return "board/boardInsertForm";
	}
	@RequestMapping("binsert.do")
	public String insertBoard(Board b, HttpServletRequest request,
			@RequestParam(name="uploadFile", required = false)MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {
			// 서버에 업로드 진행
			// saveFile메소드 : 저장하고자 하는 file 과 request를 전달해서 서버에 업로드시키고 저장된 파일명을 반환해주는 메소드
			
			String renameFileName = saveFile(file,request);
		}
		return "";
	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장된 경로를 설정하자.
		// 웹 서버 contextPath를 불러와서 폴더의 경로를 가져온다.(webapp 하위 resources)
		// /Users/moduhan/dev/KH_Academy/springWorkspace/springProject/src/main/webapp/resources
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		// root 하위의 buploadFiles 폴더를 연결 
		// \를 문자로 인식하기 위해서는 \\를 사용한다
//		String savePath = root + "/buploadFiles"; 
		String savePath = root + "\\buploadFiles"; 
		
		File folder = new File(savePath); // savePath의 폴더를 불러온다
		
		if(!folder.exists()) {
			// 폴더가 없으면 만들어라.
			folder.mkdir();
		}
		// 원본 파일명을 년월일시분초.파일확장자명으로 변
		String originalFileName = file.getOriginalFilename();// test.png
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//												[ 20200929191522.png]
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."+originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 이때 서버에 저장이된다.
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		return renamePath;
	}
	
}
