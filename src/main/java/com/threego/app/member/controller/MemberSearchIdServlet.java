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
import com.threego.app.member.model.vo.Member;

/**
 * Servlet implementation class MemberSearchId
 */
@WebServlet("/member/MemberSearchId")
public class MemberSearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/member/searchMemberId.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		MultipartRequest multipartReq = new MultipartRequest(request, getServletContext().getRealPath("/"), "utf-8");
		String email = multipartReq.getParameter("email");
       
		
		// 비지니스 로직 : 
		Member member = memberService.findByEmail(email); 
		
		// 헤더 
		response.setContentType("application/json; charset=utf-8");
		
		// 바디
		new Gson().toJson(member, response.getWriter());
		
		
		
		
		
		
	}

}
