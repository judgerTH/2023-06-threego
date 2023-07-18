package com.threego.app.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.board.model.service.BoardService;
import com.threego.app.board.model.vo.BoardComment;

/**
 * Servlet implementation class CommentCreateServlet
 */
@WebServlet("/board/CommentCreate")
public class CommentCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardService boardService = new BoardService();
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardComment boardComment = new BoardComment(writer, content, boardNo);

		int result = boardService.commentCreate(boardComment);

		response.sendRedirect(request.getContextPath() + "/board/useInquiryDetail?no=" + boardNo);
	}

}
