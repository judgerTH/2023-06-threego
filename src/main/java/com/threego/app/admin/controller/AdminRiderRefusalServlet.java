package com.threego.app.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.admin.model.service.AdminService;
import com.threego.app.notification.model.service.NotificationService;
import com.threego.app.rider.model.service.RiderService;
import com.threego.app.rider.model.vo.Rider;

/**
 * Servlet implementation class AdminRiderRefusalServlet
 */
@WebServlet("/admin/riderRefusal")
public class AdminRiderRefusalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();
	private final RiderService riderService = new RiderService();
	private final NotificationService notificationService = new NotificationService();


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 입력값
		String riderRefusalId = request.getParameter("riderRefusalId");
		
		// 반려 실시간 응답
		Rider rider = riderService.findRiderById(riderRefusalId);
		int result = notificationService.notifyRequestRiderRefusal(rider);
		
		// 반려 시 라이더 테이블에서 삭제
		int result3 = adminService.deleteRider(riderRefusalId);
		
		String refusalMsg = "수고미 지원이 반려되었습니다. 회원정보 혹은 근로계약서를 확인해주세요. 이상이 없다면 고객센터에 문의해주세요.";
		// 반려 시 반려됐다는 쪽지 발송
		int msg2 = adminService.sendRefusalMsg(riderRefusalId, refusalMsg);
		
		request.getSession().setAttribute("msg", "라이더 승인이 반려되었습니다.");
		
		// 응답
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
	}

}
