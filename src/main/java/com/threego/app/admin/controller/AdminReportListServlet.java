package com.threego.app.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 관리자 - 신고내역 누르면 신고내역리스트 조회하는 서블릿
 * @유성근
 */
@WebServlet("/admin/reportList")
public class AdminReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 입력값 처리
		
		// 2. 업무로직
		
		// 3. 응답처리 forward
		request.getRequestDispatcher("/WEB-INF/views/admin/reportList.jsp")
		.forward(request, response);
	}

}
