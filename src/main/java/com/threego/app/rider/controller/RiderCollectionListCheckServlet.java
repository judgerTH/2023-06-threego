package com.threego.app.rider.controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class RiderCollectionListCheckServlet
 */
@WebServlet("/rider/riderCollectionListCheck")
public class RiderCollectionListCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final RequestService requestService = new RequestService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내 수거목록에 관한 정보 설정
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");	
//		System.out.println(loginMember);
		String id = loginMember.getId();
		List<Request> requestList = requestService.findByMyReq(id);

		request.setAttribute("requestList", requestList);

		request.getRequestDispatcher("/WEB-INF/views/rider/riderCollectionCheckList.jsp").forward(request, response);;		//	        dispatcher.forward(request, response);
	}

}

