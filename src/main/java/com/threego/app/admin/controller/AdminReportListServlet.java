package com.threego.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.admin.model.service.AdminService;
import com.threego.app.common.util.ThreegoUtils;
import com.threego.app.warning.model.vo.Warning;

/**
 * 관리자 - 신고내역 누르면 신고내역리스트 조회하는 서블릿
 * @유성근
 */
@WebServlet("/admin/reportList")
public class AdminReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();
	private final int LIMIT = 10; // 한페이지당 회원 수

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		
		// 2. 업무로직
		List<Warning> warnings = adminService.findAllReports();
		request.setAttribute("warnings", warnings);
		
//		for(Warning warning : warnings) {
//			if(warning.getWarningCaution() != null) {
//				warning.setWarningConfirm(1);
//			}
//		}
		
		// 페이지바영역 처리
		int totalMember = adminService.getTotalMember();
		String url = request.getRequestURI();
		String pagebar = ThreegoUtils.getPagebar(cpage, LIMIT, totalMember, url);
		request.setAttribute("pagebar", pagebar);
		
		
		// 3. 응답처리 forward
		request.getRequestDispatcher("/WEB-INF/views/admin/reportList.jsp")
		.forward(request, response);
	}

}
