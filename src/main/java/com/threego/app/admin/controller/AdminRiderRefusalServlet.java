package com.threego.app.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminRiderRefusalServlet
 */
@WebServlet("/admin/riderRefusal")
public class AdminRiderRefusalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 입력값
		String riderRefusalId = request.getParameter("riderRefusalId");
		// 반려 시 라이더 테이블 상태 변경
		int result3 = adminService.updateRiderStatusTo2(riderRefusalId);
		
		String refusalMsg = "반려되었습니다. 회원정보 혹은 근로계약서를 확인해주세요";
		// 반려 시 반려됐다는 쪽지 발송
		int msg2 = adminService.sendRefusalMsg(riderRefusalId, refusalMsg);
		
		// 응답
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
	}

}
