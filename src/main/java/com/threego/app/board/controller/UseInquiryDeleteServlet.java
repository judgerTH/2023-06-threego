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
@WebServlet("/board/useInquiryDelete")
public class UseInquiryDeleteServlet extends HttpServlet {
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
		System.out.println(no);
		
		
		int result = boardService.deleteBoard(no); 
		
		 response.setStatus(HttpServletResponse.SC_OK);

	}

}
