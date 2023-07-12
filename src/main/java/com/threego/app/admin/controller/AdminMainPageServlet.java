package com.threego.app.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminMainPageServlet
 */
@WebServlet("/admin/adminMain")
public class AdminMainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 2. 업무로직
		// 오늘 방문자 수
    	int todayCount = adminService.getVisitTodayCount();
    	
    	// 어제 방문자 수
    	int yesterdayCount = adminService.getVisitYesterdayCount();
    	
    	// 그제 방문자 수
    	int twoDayAgoCount = adminService.getVisitTwoDayAgoCount();
    	
    	// 3일전 방문자 수
    	int threeDayAgoCount = adminService.getVisitThreeDayAgoCount(); 
    	
    	HttpSession session = request.getSession();
    	
    	// 세션 속성에 담아준다.
    	session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
    	session.setAttribute("yesterdayCount", yesterdayCount); // 어제 방문자 수
    	session.setAttribute("twoDayAgoCount", twoDayAgoCount); // 그제 방문자 수
    	session.setAttribute("threeDayAgoCount", threeDayAgoCount); // 3일전 방문자 수
		
		// 3. 응답
		request.getRequestDispatcher("/WEB-INF/views/admin/adminMain.jsp")
		.forward(request, response);
	}

}
