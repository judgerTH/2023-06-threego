package com.threego.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.admin.model.service.AdminService;
import com.threego.app.board.model.service.BoardService;
import com.threego.app.board.model.vo.Board;
import com.threego.app.common.util.ThreegoUtils;
import com.threego.app.member.model.vo.Member;

/**
 * Servlet implementation class AdminNoticeDeleteServlet
 */
@WebServlet("/admin/noticeDelete")
public class AdminNoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();
	private final BoardService boardService = new BoardService();
	private final int LIMIT = 10; // 한페이지당 공지 수
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		String noticeNo = request.getParameter("noticeNo");
		
		int result = adminService.deleteNotice(noticeNo);
		
		
		List<Board> boards = boardService.findAllBoards(start, end);
	    // 페이지바 영역 처리
	    int totalNotice = adminService.getTotalNotice();
	    String url = request.getRequestURI();
	    String pagebar = ThreegoUtils.getPagebar(cpage, LIMIT, totalNotice, url);

	    request.setAttribute("boards", boards);
	    request.setAttribute("pagebar", pagebar);
	    response.sendRedirect(request.getContextPath() + "/admin/writeNotice");
	}

}
