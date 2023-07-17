package com.threego.app.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.board.model.service.BoardService;
import com.threego.app.board.model.vo.Board;
import com.threego.app.common.util.ThreegoUtils;


/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/board/useInquiryDetail")
public class UseInquiryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardService boardService = new BoardService();
	
	/**
	 * Secure Coding
	 * - XSS 공격 방어처리 (Cross Site Scripting) 
	 * - 악성 script태그를 실행해 사용자정보를 탈취하거나 사이트의 위해를 가하는 공격
	 * - <> 부분이 html로 처리되어 생긴 문제이므로 escaping처리를 해야한다.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값 처리 ?no=12
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 2. 업무로직
		
		
		
		Board board = boardService.findByNo(no); //
		
		
		// secure coding처리 
		String unsecureTitle = board.getBoardTitle();
		String secureTitle = ThreegoUtils.escapeHtml(unsecureTitle);
		board.setBoardTitle(secureTitle);
		
		
		// 3. 응답처리 jsp
		request.setAttribute("board", board);
		
		
		request.getRequestDispatcher("/WEB-INF/views/board/useInquiryDetail.jsp")
			.forward(request, response);
	}

}






