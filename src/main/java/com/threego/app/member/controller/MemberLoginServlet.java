package com.threego.app.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.threego.app.member.model.service.MemberService;
import com.threego.app.member.model.vo.Member;

/**
 * Servlet implementation class LoginMember
 */
@WebServlet("/member/memberLogin")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp").forward(request, response);;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자 입력값 
			String id = request.getParameter("login-id");
			String pwd = request.getParameter("login-pwd");
		
		// 2. 업무로직 
			Member loginMember = memberService.findById(id);
			
			HttpSession session = request.getSession();
			
			
			
			session.setAttribute("loginMember", loginMember);
			// 3. 응답처리 
			response.sendRedirect(request.getContextPath());
		
	}

}
