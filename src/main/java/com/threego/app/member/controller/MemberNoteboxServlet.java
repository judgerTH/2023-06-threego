package com.threego.app.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.common.util.ThreegoUtils;
import com.threego.app.member.model.service.MemberService;
import com.threego.app.msgbox.model.vo.MsgBox;

/**
 * Servlet implementation class MemberNoteboxServlet
 */
@WebServlet("/member/notebox")
public class MemberNoteboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();
	private final int LIMIT = 10; // 한페이지당 회원 수

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이징처리
		int cpage = 1; // 기본값처리
		try {
			cpage = Integer.parseInt(request.getParameter("cpage")); 			
		} catch (NumberFormatException e) {
			// 예외처리외에 아무것도 하지 않음.
		}
			// cpage = 1 -> start = 1, end = 10
			// cpage = 2 -> start = 11, end = 15
			// cpage = 3 -> start = 16, end = 20
		int start = (cpage - 1) * LIMIT + 1;
		int end = cpage * LIMIT;
		
		// 입력값
		String memberId = request.getParameter("memberId");
		
		// 업무로직
		List<MsgBox> msgBoxes = memberService.getMsgBoxListPaging(memberId, start, end);
		
		HttpSession session = request.getSession(); 
		session.setAttribute("msgBoxes", msgBoxes);
		
		// 페이지바영역 처리
		int totalMsg = memberService.getTotalMsg(memberId);

//		String url = request.getRequestURI();
		String url = "/threego/member/notebox?"+memberId;
		String pagebar = ThreegoUtils.getPagebar(cpage, LIMIT, totalMsg, url);
	

		request.setAttribute("pagebar", pagebar);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/member/memberNoteBox.jsp");
		reqDispatcher.forward(request, response);
	}

}
