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
import com.threego.app.member.model.service.MemberService;
import com.threego.app.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollSearchServlet
 */
@WebServlet("/member/memberEnrollSearch")
public class MemberEnrollSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		if(userId!=null) {
			
//			System.out.println(userId);
			Member searchMemberById = memberService.findById(userId);
			if(searchMemberById  != null) {
				response.setContentType("application/json; charset=utf-8");
				Map<String, Object> map = new HashMap<>();
				map.put("result", "NNNNN");
				new Gson().toJson(map, response.getWriter());
			}else {
				response.setContentType("application/json; charset=utf-8");
				Map<String, Object> map = new HashMap<>();
				map.put("result", "YYYYY");
				new Gson().toJson(map, response.getWriter());
			}
			
		}
		String email = request.getParameter("email");
		if(email!=null) {
//			System.out.println(email);
			Member searchMemberByEmail = memberService.findByEmail(email);
			if(searchMemberByEmail  != null) {
				response.setContentType("application/json; charset=utf-8");
				Map<String, Object> map = new HashMap<>();
				map.put("result", "NNNNN");
				new Gson().toJson(map, response.getWriter());
			}else {
				response.setContentType("application/json; charset=utf-8");
				Map<String, Object> map = new HashMap<>();
				map.put("result", "YYYYY");
				new Gson().toJson(map, response.getWriter());
			}
			
		}
		String phone = request.getParameter("phone");
		if(phone!=null) {
			System.out.println(phone);
			int result = memberService.findByPhone(phone);
			if(result>0) {
				response.setContentType("application/json; charset=utf-8");
				Map<String, Object> map = new HashMap<>();
				map.put("result", "NNNNN");
				new Gson().toJson(map, response.getWriter());
			}else {
				response.setContentType("application/json; charset=utf-8");
				Map<String, Object> map = new HashMap<>();
				map.put("result", "YYYYY");
				new Gson().toJson(map, response.getWriter());
			}
			
		}
		
		
		
		
	}

}
