package com.threego.app.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminRiderApprovement
 */
@WebServlet("/admin/riderApprovement")
public class AdminRiderApprovement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 입력값 
		String riderId = request.getParameter("riderId");
		System.out.println(riderId);
		
		int result = adminService.updateRiderStatus(riderId);
		
		request.getSession().setAttribute("msg", "라이더 승인이 완료되었습니다.");
		
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
	}

}
