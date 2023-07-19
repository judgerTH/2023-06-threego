package com.threego.app.rider.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.common.util.ThreegoUtils;
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
	private final int LIMIT = 10; // 한페이지당 수거 수
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내 수거목록에 관한 정보 설정
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");	
		String id = loginMember.getId();
		

		// 페이징처리
		int cpage = 1; // 기본값처리
		try {
			cpage = Integer.parseInt(request.getParameter("cpage")); 			
		} catch (NumberFormatException e) {
			// 예외처리외에 아무것도 하지 않음.
		}
		// cpage = 1 -> start = 1, end = 10
		// cpage = 2 -> start = 11, end = 20
		// cpage = 3 -> start = 21, end = 30
		int start = (cpage - 1) * LIMIT + 1;
		int end = cpage * LIMIT;
		int totalCollection = requestService.getTotalCollection(id);
		String url = request.getRequestURI();
		String pagebar = ThreegoUtils.getPagebar(cpage, LIMIT, totalCollection, url);
		
		List<Request> requestList = requestService.findByMyReq(start, end, id);
		
		request.setAttribute("requestList", requestList);
		request.setAttribute("pagebar", pagebar);
		request.getRequestDispatcher("/WEB-INF/views/rider/riderCollectionCheckList.jsp").forward(request, response);;		//	        dispatcher.forward(request, response);
	}

}

