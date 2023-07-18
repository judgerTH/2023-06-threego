package com.threego.app.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.board.model.service.BoardService;
import com.threego.app.board.model.vo.Board;

/**
 * Servlet implementation class UseInquiryUpdateServlet
 */
@WebServlet("/board/useInquiryUpdate")
public class UseInquiryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardService boardService = new BoardService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int no = Integer.parseInt(request.getParameter("no"));
		Board board = boardService.findByNo(no);
		request.setAttribute("board", board);
		request.getRequestDispatcher("/WEB-INF/views/board/useInquiryUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String boardContent = request.getParameter("boardContent");
		System.out.println(no);
		System.out.println(title);
		System.out.println(boardContent);
		
		Board board = new Board();
		board.setBoardNo(no);
		board.setBoardContent(boardContent);
		board.setBoardTitle(title);
		System.out.println(board);
		
		int result = boardService.updateBoard(board); 
		 response.setStatus(HttpServletResponse.SC_OK);
		System.out.println(result);
		response.getWriter().write(String.valueOf(board.getBoardNo()));

	}

}
