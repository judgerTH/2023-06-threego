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
		
		// 업무로직
		// 승인 시 라이더 테이블 상태 변경
		int result = adminService.updateRiderStatus(riderId);
		// 승인 시 멤버 테이블 권한 변경
		int result2 = adminService.updateMemberRole(riderId);
		
		String approvementMsg = "승인 되었습니다. 오늘부터 수고미로 활동하실 수 있습니다.";
		// 승인 시 승인됐다는 쪽지 발송
		int msg = adminService.sendApprovementMsg(riderId, approvementMsg);
		
		
		
		request.getSession().setAttribute("msg", "라이더 승인이 완료되었습니다.");
		
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
	}

}
