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
import com.threego.app.common.util.MemberMvcUtils;
import com.threego.app.member.model.service.MemberService;

/**
 * Servlet implementation class MemberResetPwdServlet
 */
@WebServlet("/member/memberResetPwd")
public class MemberResetPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MultipartRequest multiReq = new MultipartRequest(request, getServletContext().getRealPath("/"), "utf-8");
		
		
		String id = multiReq.getParameter("searchedId");
		String pwd = MemberMvcUtils.getEncryptedPassword(multiReq.getParameter("reset-pwd"),id);
	
		
		//업무로직 
		int result = memberService.updatePwd(id, pwd);
		
		if(result > 0) {
			
			response.setContentType("application/json; charset=utf-8");
			
			Map<String, Object> map = new HashMap<>();

			map.put("result", "비밀번호 변경이 완료되었습니다.");
			map.put("id", id);
			
			new Gson().toJson(map, response.getWriter());
			
		} 
	}

}
