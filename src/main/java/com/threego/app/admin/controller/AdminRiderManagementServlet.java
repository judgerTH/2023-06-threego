package com.threego.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.admin.model.service.AdminService;
import com.threego.app.rider.model.vo.Rider;

/**
 * Servlet implementation class AdminRiderManagementServlet
 */
@WebServlet("/admin/riderManagement")
public class AdminRiderManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 업무로직
		// 라이더 조회 - 라이더 불러오기
		List<Rider> riders = adminService.getAllRiderList();
		request.setAttribute("riders", riders);
		
		// 라이더 승인 - 승인 대기 라이더 불러오기
		List<Rider> waitingRiders = adminService.getApproveRiderList();
		request.setAttribute("waitingRiders", waitingRiders);
		
		// 노 승인 라이더 수 받기
		int unapprovedRiderCount2 = adminService.getUnapprovedRiderCount();
		request.setAttribute("unapprovedRiderCount2", unapprovedRiderCount2);
		
		// 응답
		request.getRequestDispatcher("/WEB-INF/views/admin/rider.jsp")
		.forward(request, response);
	}

}
