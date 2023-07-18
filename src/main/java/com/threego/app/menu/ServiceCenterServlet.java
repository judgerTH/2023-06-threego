package com.threego.app.menu;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.admin.model.service.AdminService;
import com.threego.app.board.model.service.BoardService;
import com.threego.app.board.model.vo.Board;
import com.threego.app.common.util.ThreegoUtils;

/**
 * Servlet implementation class ServiceCenterServlet
 */
@WebServlet("/menu/serviceCenter")
public class ServiceCenterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();
	private final BoardService boardService = new BoardService();
	private final int LIMIT = 10; // 한페이지당 공지사항 수

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
	    // 공지사항 작성 후에 다시 공지사항 목록을 불러올 때 사용하는 코드
	    int cpage = 1; // 기본값 처리
	    try {
	        cpage = Integer.parseInt(request.getParameter("cpage")); 			
	    } catch (NumberFormatException e) {
	        // 예외 처리외에 아무 것도 하지 않음.
	    }
	    int start = (cpage - 1) * LIMIT + 1;
	    int end = cpage * LIMIT;

	    List<Board> boards = boardService.findAllBoards(start, end);
		
	    // 페이지바 영역 처리
	    int totalNotice = adminService.getTotalNotice();
	    String url = request.getRequestURI();
	    String pagebar = ThreegoUtils.getPagebar(cpage, LIMIT, totalNotice, url);

	    request.setAttribute("boards", boards);
	    request.setAttribute("pagebar", pagebar);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/menu/serviceCenter.jsp");
		reqDispatcher.forward(request, response);
	}

}
