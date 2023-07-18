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
import com.threego.app.notification.model.service.NotificationService;
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
	private final NotificationService notificationService = new NotificationService();
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
		
		// 접수 현황에 따른 실시간 알림
		if(acceptedRequest.getReqStatus().equals("3")) { // 접수 취소일 경우
			result = notificationService.notifyCancelRequest(_writer);
			// 메세지 전송
			String msg = "접수가 취소 되었습니다. 다시 신청해주세요.";
			result = requestService.insertRequest(_writer, msg);
		} else if (acceptedRequest.getReqStatus().equals("2")) { // 처리완료일 경우
			result = notificationService.notifyCompleteRequest(_writer);
			// 메세지 전송
			String msg = "수거 완료되었습니다. 다음에 또 이용해주세요~!";
			result = requestService.insertRequest(_writer, msg);
		}
		
		// 메세지 전송
		
		
		request.setAttribute("writer", writer);
		request.setAttribute("acceptedRequest", acceptedRequest);
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
		
	}

}
