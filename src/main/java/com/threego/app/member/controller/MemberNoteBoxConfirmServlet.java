package com.threego.app.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.threego.app.member.model.service.MemberService;

/**
 * Servlet implementation class MemberNoteBoxConfirmServlet
 */
@WebServlet("/member/noteBoxConfirm")
public class MemberNoteBoxConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 입력값
		int msgNo = Integer.parseInt(request.getParameter("msgNo"));
		String msgReceiver = request.getParameter("msgReceiver");
		System.out.println(msgNo);
		
		// 업무로직
		// msgBox Confirm O로 바꿔주기
		int result = memberService.updateMsgBoxConfirm(msgNo);
		
		// 응답
		response.sendRedirect(request.getContextPath() + "/member/notebox?memberId=" + msgReceiver);
	}
	

}
