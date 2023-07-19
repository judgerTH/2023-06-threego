package com.threego.app.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.member.model.service.MemberService;
import com.threego.app.payment.model.vo.PaymentDetail;

/**
 * Servlet implementation class MemberRequestListServlet
 */
@WebServlet("/member/paymentList")
public class MemberPaymentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		
		List<PaymentDetail> paymentList = memberService.findPaymentList(memberId);
		// 이용권이름, 결제금액, 결제일, 잔여횟수 조회
		
		 PaymentDetail totalPrice = memberService.findTotalPrice(memberId);
		 // 누적 금액 조회
		
		 request.setAttribute("paymentList", paymentList);
		 request.setAttribute("totalPrice", totalPrice);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/member/memberPaymentList.jsp");
		reqDispatcher.forward(request, response);
	}

}
