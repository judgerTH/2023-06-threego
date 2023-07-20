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
import com.threego.app.msgbox.model.vo.MsgBox;
import com.threego.app.notification.model.service.NotificationService;
import com.threego.app.rider.model.vo.Rider;
import com.threego.app.warning.model.vo.WarnigMemberRole;
import com.threego.app.warning.model.vo.Warning;

/**
 * Servlet implementation class AdminWarningNoticeServlet
 */
@WebServlet("/admin/warningNotice")
public class AdminWarningNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();
	private final NotificationService notificationService = new NotificationService();
	private final int LIMIT = 10; // 한페이지당 회원 수
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String warningID = request.getParameter("warningID"); // 신고자 ID
		String warningNotice = request.getParameter("warningNotice"); // 주의조치사항 내용
		int warningNo = Integer.parseInt(request.getParameter("warningNo"));
		
		// 신고 테이블 주의조치 업데이트
		int result2 = adminService.updateWarningCaution(warningNo, warningNotice);
		// 주의조치 업데이트 후 해당 넘버로 신고테이블에서 객체 받아오기
//		Warning warning2 = adminService.getWarningListByID(warningID);
		// 필요한 정보(request 테이블 - writer, rider / member 테이블 - role) 받아오기
		Warning warning = adminService.getInfoFromRequestAndMember(warningNo);
		// msgbox에 주의 조치 삽입 (리시버 : 신고자 role이 U라면 request 테이블의 rider)
		String requestRider = warning.getRequestRider();
		String requestWriter = warning.getRequestWriter();
		if(warning.getMemberRole() == WarnigMemberRole.U) {
			int result = adminService.insertWarningNotice(requestRider, warningNotice);
			
			// 실시간 응답
			result = notificationService.notifyWarningCatuionByRiderId(requestRider);
			
			request.getSession().setAttribute("msg", "라이더 승인이 완료되었습니다.");
			// msgbox에 주의 조치 삽입 (리시버 : 신고자 role이 R이라면 request 테이블의 writer)
		} else if(warning.getMemberRole() == WarnigMemberRole.R) {
			int result = adminService.insertWarningNotice(requestWriter, warningNotice);
			
			// 실시간 응답
			result = notificationService.notifyWarningCatuionByrequestWriter(requestWriter);
		}
		
		List<Warning> warnings = adminService.findAllReports();
		
		// 페이지바영역 처리
		int totalMember = adminService.getTotalMember();
		String url = request.getRequestURI();
		String pagebar = ThreegoUtils.getPagebar(cpage, LIMIT, totalMember, url);
		
		request.setAttribute("warnings", warnings);
		request.setAttribute("pagebar", pagebar);
		response.sendRedirect(request.getContextPath() + "/admin/reportList");
	}

}
