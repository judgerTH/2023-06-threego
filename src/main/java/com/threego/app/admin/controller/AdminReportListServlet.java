package com.threego.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.admin.model.service.AdminService;
import com.threego.app.warning.model.vo.Warning;

/**
 * 관리자 - 신고내역 누르면 신고내역리스트 조회하는 서블릿
 * @유성근
 */
@WebServlet("/admin/reportList")
public class AdminReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 입력값 처리
		
		
		// 2. 업무로직
		List<Warning> warnings = adminService.findAllReports();
		request.setAttribute("warnings", warnings);
		
		// 3. 응답처리 forward
		request.getRequestDispatcher("/WEB-INF/views/admin/reportList.jsp")
		.forward(request, response);
	}

}
