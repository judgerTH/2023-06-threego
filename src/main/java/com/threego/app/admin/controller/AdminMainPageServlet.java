package com.threego.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.admin.model.service.AdminService;
import com.threego.app.board.model.vo.Board;
import com.threego.app.warning.model.vo.Warning;
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
		
		/*
		 * 관리자 페이지 메인 화면에 띄울 데이터들
		 *
		 */
		// 지난달 매출 - 이태현
		int lastMonthPayment = adminService.getlastMonthPayment();
		request.setAttribute("lastMonthPayment", lastMonthPayment);
		
		// 이번달 매출 - 이태현
		int thisMonthPayment= adminService.getthisMonthPayment();
		request.setAttribute("thisMonthPayment", thisMonthPayment);
		
		// 오늘 매출 - 이태현
		int todayPayment = adminService.getTodayPayment();
		request.setAttribute("todayPayment", todayPayment);
		
<<<<<<< HEAD
		// 어제 매출
		int yesterdayPayment = adminService.getYesterdayPayment();
		request.setAttribute("yesterdayPayment", yesterdayPayment);
		
		// 2일전 매출
		int twoDayAgoPayment = adminService.getTwoDayAgoPayment();
		request.setAttribute("twoDayAgoPayment", twoDayAgoPayment);
		
		// 3일전 매출
		int threeDayAgoPayment = adminService.getThreeDayAgoPayment();
		request.setAttribute("threeDayAgoPayment", threeDayAgoPayment);
		
		// 오늘 방문자 수
=======
		// 오늘 방문자 수 - 유성근
>>>>>>> branch 'master' of https://github.com/semijo6/semi-project.git
    	int todayCount = adminService.getVisitTodayCount();
    	
    	// 어제 방문자 수 - 유성근
    	int yesterdayCount = adminService.getVisitYesterdayCount();
    	
    	// 그제 방문자 수 - 유성근
    	int twoDayAgoCount = adminService.getVisitTwoDayAgoCount();
    	
    	// 3일전 방문자 수 - 유성근
    	int threeDayAgoCount = adminService.getVisitThreeDayAgoCount();
    	
    	// 오늘 주문수 - 유성근
    	int todayPaymentCount = adminService.getTodayPaymentCount();
    	
    	// 어제 주문수 - 유성근
    	int yesterdayPaymentCount = adminService.getYesterdayPaymentCount();
    	
    	// 2일 전 주문수 - 유성근
    	int twoDayAgoPaymentCount = adminService.getTwoDayAgoPaymentCount();
    	
    	// 3일 전 주문수 - 유성근
    	int threeDayAgoPaymentCount = adminService.getThreeDayAgoPaymentCount();
    	
    	// 승인되지 않은 라이더 수
    	int unapprovedRiderCount = adminService.getUnapprovedRiderCount();
    	
    	// 요청 취소 갯수
    	int canceledRequestCount = adminService.getCanceledRequestCount();
    	
    	// 신고 갯수
    	int warningCount = adminService.getWarningCount();
    	
    	// 문의사항 중 답변이 필요한 게시물의 수
    	int countOfBoardWithOutComment = adminService.getCountOfBoardWithOutComment();
    	
    	// 신고현황 6개만 띄우기
    	List<Warning> warnings = adminService.findSixReports();
		request.setAttribute("warnings", warnings);
    	
		// 문의사항 6개 띄우기
		List<Board> boards = adminService.findSixBoards();
		request.setAttribute("boards", boards);
		
    	HttpSession session = request.getSession();
    	
    	// 세션 속성에 담아준다.
    	session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
    	session.setAttribute("yesterdayCount", yesterdayCount); // 어제 방문자 수
    	session.setAttribute("twoDayAgoCount", twoDayAgoCount); // 그제 방문자 수
    	session.setAttribute("threeDayAgoCount", threeDayAgoCount); // 3일전 방문자 수
    	
    	session.setAttribute("todayPaymentCount", todayPaymentCount); // 오늘 주문수
    	session.setAttribute("yesterdayPaymentCount", yesterdayPaymentCount); // 어제 주문수
    	session.setAttribute("twoDayAgoPaymentCount", twoDayAgoPaymentCount); // 그제 주문수
    	session.setAttribute("threeDayAgoPaymentCount", threeDayAgoPaymentCount); // 3일전 주문수
    	
    	session.setAttribute("unapprovedRiderCount", unapprovedRiderCount); // 승인되지 않은 라이더수
    	
    	session.setAttribute("canceledRequestCount", canceledRequestCount); // 취소된 요청 수
    	
    	session.setAttribute("warningCount", warningCount); // 신고 수
    	
    	session.setAttribute("countOfBoardWithOutComment", countOfBoardWithOutComment); // 답변대기문의수
		
		// 3. 응답
		request.getRequestDispatcher("/WEB-INF/views/admin/adminMain.jsp")
		.forward(request, response);
	}

}
