package com.threego.app.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.threego.app.common.util.MemberMvcUtils;
import com.threego.app.member.model.service.MemberService;
import com.threego.app.member.model.vo.Member;

/**
 * Servlet implementation class memberEnrollServlet
 */
@WebServlet("/member/memberEnroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberEnroll.jsp")
			.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saveDirectory = getServletContext().getRealPath("/");
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, "utf-8");
				
		String id = multiReq.getParameter("id");
		String pwd = MemberMvcUtils.getEncryptedPassword(multiReq.getParameter("pwd"), id);
		String name =multiReq.getParameter("name");
		String email =multiReq.getParameter("email");
		String phone = multiReq.getParameter("phone");
		String post = multiReq.getParameter("post");
		String _address = multiReq.getParameter("address");
		String detailAddr = multiReq.getParameter("detailAddr");
		String address = _address+" " +detailAddr;
		
		
		
		Member member = new Member(id, pwd, name, email, phone, null, post, address, null);
		
		int result = memberService.insertMember(member);
		response.setContentType("application/json; charset=utf-8");
//		Map<String, Object> map = new HashMap<>();
//		map.put("result", "성공");
//		map.put("message", "성공적으로 셀럽을 등록했습니다.");
//		map.put("member", member);
//		new Gson().toJson(map, response.getWriter()); // 응답메세지에 src를 json문자열로 변환해 출력
		
	
	}

}
