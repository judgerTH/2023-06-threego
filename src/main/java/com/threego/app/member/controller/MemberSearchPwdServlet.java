package com.threego.app.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.member.model.dao.MemberDao;
import com.threego.app.member.model.service.MemberService;
import com.threego.app.member.model.vo.Member;

/**
 * Servlet implementation class MemberSearchPwd
 */
@WebServlet("/member/memberSearchPwd")
public class MemberSearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/member/memberSearchPwd.jsp").forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("search-id");
		String email = request.getParameter("email");
	
		// 업무로직 
		// 아이디, 이메일로 조회했을때 동일하면, 비밀번호 변경 페이지로 이동! 
		Member member = memberService.findById(id); 
		// HttpSession session = request.getSession();
		if(member!=null && email.equals(member.getEmail())) {
			// 만약 아이디 비밀번호가 동일하다면 비밀번호 재설정 페이지로 이동해야함! 
			RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/member/memberResetPwd.jsp");
			reqDispatcher.forward(request, response);
			
		} else {
			
			request.setAttribute("searchedMember", member);
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer+"error");
			
		}
		
		
	}

}
