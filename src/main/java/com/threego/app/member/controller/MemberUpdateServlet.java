package com.threego.app.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.common.util.MemberMvcUtils;
import com.threego.app.member.model.service.MemberService;
import com.threego.app.member.model.vo.Member;
import com.threego.app.member.model.vo.MemberRole;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/member/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String name = request.getParameter("name");
		String password = MemberMvcUtils.getEncryptedPassword(request.getParameter("mb_password"), memberId);
		
		
		String phone = request.getParameter("mb_tel");
		String email = request.getParameter("mb_email");
		String Zip = request.getParameter("mb_zip");
		String Addr1 = request.getParameter("mb_addr1");
		String Addr2 = request.getParameter("mb_addr2");

		String address = Addr1 + " " + Addr2;
		
		Member member = new Member(memberId, password, name, email, phone, MemberRole.U, Zip, address, null);
		
		System.out.println(member);
		int result = memberService.updateMember(member);
		System.out.println(member);
		HttpSession session = request.getSession();

		session.setAttribute("loginMember", memberService.findById(memberId));

		response.sendRedirect(request.getContextPath() + "/member/myPage");
		
	}

}
