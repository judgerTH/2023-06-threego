package com.threego.app.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.threego.app.common.util.MemberMvcUtils;
import com.threego.app.member.model.service.MemberService;
import com.threego.app.member.model.vo.Member;
import com.threego.app.msgbox.model.vo.MsgBox;

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
		
		request.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자 입력값 
			String id = request.getParameter("login-id");
			String pwd = MemberMvcUtils.getEncryptedPassword(request.getParameter("login-pwd"), id);
					
		
		// 2. 업무로직 
			Member member = memberService.findById(id);
			
			HttpSession session = request.getSession();
			

			if(member != null && pwd.equals(member.getPwd())) {
				session.setAttribute("loginMember", member);
				response.sendRedirect(request.getContextPath());
				
			} else {
				session.setAttribute("msg", "로그인 정보가 일치하지 않습니다. 확인해주세요.");
				String referer = request.getHeader("Referer");
				response.sendRedirect(referer);
			}
			
			List<MsgBox> msgBoxes = memberService.getMsgBoxList(member.getId());
			session.setAttribute("msgBoxes", msgBoxes);
			

	}

}
