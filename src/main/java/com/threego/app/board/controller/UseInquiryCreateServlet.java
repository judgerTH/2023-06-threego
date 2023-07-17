package com.threego.app.board.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.board.model.service.BoardService;
import com.threego.app.board.model.vo.Board;
import com.threego.app.board.model.vo.BoardType;

/**
 * Servlet implementation class BoardCreatServlet
 */
@WebServlet("/board/useInquiryCreate")

public class UseInquiryCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardService boardService = new BoardService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/useInquiryCreate.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("boardContent");
		
		Board board = new Board(0, null, title, writer, content, null, 0) ;
		int result = boardService.insertBoard(board);
		System.out.println(result);
		response.sendRedirect(request.getContextPath() + "/board/useInquiryDetail?no=" + board.getBoardNo());
	}

}
