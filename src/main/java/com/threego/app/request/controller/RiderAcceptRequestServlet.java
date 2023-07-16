 package com.threego.app.request.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.member.model.vo.Member;
import com.threego.app.request.model.service.RequestService;
import com.threego.app.request.model.vo.Request;

/**
 * Servlet implementation class RiderAcceptRequestServlet
 */
@WebServlet("/request/acceptRequest")
public class RiderAcceptRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final RequestService requestService = new RequestService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 수거 리스트 보기에서 frm submit 하면 정보 받아와서 해당 정보 셋팅하기
		String req = request.getParameter("reqNo");
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");	
		String rId = loginMember.getId();
		int reqNo = Integer.parseInt(request.getParameter("reqNo"));
		
		
		// request 수락 상태 업데이트
		int result = requestService.acceptRequest(reqNo, rId);
		
		// 업데이트 된 정보 받아서 request에 저장하기 
		Request acceptedRequest = requestService.findByReqno(reqNo);
		
		
		request.setAttribute("acceptedRequest", acceptedRequest);
		request.getRequestDispatcher("/WEB-INF/views/request/RequestListView.jsp").forward(request, response);
		
	
		
		
		
	}

}
