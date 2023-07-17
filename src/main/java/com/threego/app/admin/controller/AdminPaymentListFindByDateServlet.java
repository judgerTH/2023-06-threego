package com.threego.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.common.util.ThreegoUtils;
import com.threego.app.payment.model.service.PaymentService;
import com.threego.app.payment.model.vo.Payment;

/**
 * Servlet implementation class AdminPaymentListFindByDateServlet
 */
@WebServlet("/admin/PaymentFindByDate")
public class AdminPaymentListFindByDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final int LIMIT = 10; // 한페이지당 회원 수
	private final PaymentService paymentService = new PaymentService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		
		String startDay = request.getParameter("searchStart");
		String endDay = request.getParameter("searchEnd");
		
		// 선택 날짜 매출조회
		List<Payment> payments = paymentService.findByDate(start, end, startDay, endDay);
		
		// 페이지바영역 처리
		int totalPayment = paymentService.getTotalPayment();
		String url = request.getRequestURI();
		String pagebar = ThreegoUtils.getPagebar(cpage, LIMIT, totalPayment, url);
		
		request.setAttribute("payments", payments);
		request.setAttribute("pagebar", pagebar);
		request.getRequestDispatcher("/WEB-INF/views/admin/paymentList.jsp")
		.forward(request, response);
	}

}
