package com.threego.app.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.board.model.vo.Board;
import com.threego.app.common.util.ThreegoUtils;


/**
 * Servlet implementation class UseInquiryListServlet
 */
@WebServlet("/board/useInquiryList")
public class UseInquiryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final int LIMIT = 10; // 한페이지당 게시물수

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자입력값 처리
		int cpage = 1; // 기본값처리
		try {
			cpage = Integer.parseInt(request.getParameter("cpage")); 			
		} catch (NumberFormatException e) {
			// 예외처리외에 아무것도 하지 않음.
		}
		// cpage = 1 -> start = 1, end = 10
		// cpage = 2 -> start = 11, end = 20
		// cpage = 3 -> start = 21, end = 30
		int start = (cpage - 1) * LIMIT + 1;
		int end = cpage * LIMIT;
		
		// 2. 업무로직
//		List<Board> boards = boardService.findAll(start, end);
		
		// xss공격대비처리
//		for(Board board : boards) {
//			board.setTitle(ThreegoUtils.escapeHtml(board.getTitle()));
//		}
		
		// 페이지바영역 처리
//		int totalContent = boardService.getTotalContent();
		String url = request.getRequestURI(); // /mvc/board/boardList
//		String pagebar = ThreegoUtils.getPagebar(cpage, LIMIT, totalContent, url);
		
//		request.setAttribute("boards", boards);
//		request.setAttribute("pagebar", pagebar);
		// 3. 응답처리

		
		request.getRequestDispatcher("/WEB-INF/views/board/useInquiryList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

}
