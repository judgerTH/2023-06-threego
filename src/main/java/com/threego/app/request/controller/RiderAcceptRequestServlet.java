 package com.threego.app.request.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.threego.app.member.model.service.MemberService;
import com.threego.app.member.model.vo.Member;
import com.threego.app.request.model.service.RequestService;
import com.threego.app.request.model.vo.Request;

/**
 * Servlet implementation class RiderAcceptRequestServlet
 */

@WebServlet(urlPatterns = {"/request/acceptRequest", "/request/requestDetail"})
public class RiderAcceptRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final RequestService requestService = new RequestService();
	private final MemberService memberService = new MemberService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String req = request.getParameter("reqNo");
	
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");	
		String rId = loginMember.getId();
		int reqNo = Integer.parseInt(request.getParameter("reqNo"));
		String _writer = request.getParameter("reqWriter");
		//System.out.println(_writer);
		
		// request 번호로 조회하기
		Request acceptedRequest = requestService.findByReqno(reqNo);
		
		// writer 조회하기
		Member writer = memberService.findById(_writer);
		request.setAttribute("writer", writer);
		
		request.setAttribute("acceptedRequest", acceptedRequest);
		request.getRequestDispatcher("/WEB-INF/views/request/RequestListView.jsp").forward(request, response);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//MultipartRequest multiReq = new MultipartRequest(request, getServletContext().getRealPath("/"), "utf-8");
		
		int reqNo = Integer.parseInt(request.getParameter("reqNo"));
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");	
		String rId = loginMember.getId();
		
		String reqStatus = request.getParameter("reqStatus");
		String _writer = request.getParameter("reqWriter");
		
		
		int result = requestService.updateRequest(reqNo, rId, reqStatus);
		Request acceptedRequest = requestService.findByReqno(reqNo);
		Member writer = memberService.findById(_writer);
		System.out.println(_writer);
		
		request.setAttribute("writer", writer);
		request.setAttribute("acceptedRequest", acceptedRequest);
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
		
	}

}
