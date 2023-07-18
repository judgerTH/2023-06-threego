package com.threego.app.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.member.model.service.MemberService;
import com.threego.app.msgbox.model.vo.MsgBox;

/**
 * Servlet implementation class MemberNoteboxServlet
 */
@WebServlet("/member/notebox")
public class MemberNoteboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력값
		String memberId = request.getParameter("memberId");
		
		// 업무로직
		List<MsgBox> msgBoxes = memberService.getMsgBoxList(memberId);
		request.setAttribute("msgBoxes", msgBoxes);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/member/memberNoteBox.jsp");
		reqDispatcher.forward(request, response);
	}

}
