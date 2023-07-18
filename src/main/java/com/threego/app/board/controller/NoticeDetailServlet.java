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
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/board/noticeDetail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardService boardService = new BoardService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
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
		
		
		request.getRequestDispatcher("/WEB-INF/views/board/noticeDetail.jsp")
			.forward(request, response);
	}

}
