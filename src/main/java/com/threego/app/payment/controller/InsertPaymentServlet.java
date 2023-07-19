package com.threego.app.payment.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.threego.app.payment.model.service.PaymentService;
import com.threego.app.payment.model.vo.Payment;

/**
 * Servlet implementation class InsertPaymentServlet
 */
@WebServlet("/payment/insertpayment")
public class InsertPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final PaymentService paymentService = new PaymentService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 값 가져오기
		String id = request.getParameter("id");
		String ticketId = request.getParameter("ticketSelect");

		int result = paymentService.insertPayment(id, ticketId);
		// 수거신청 등 다른 동작 수행

		Payment payment = paymentService.findPayment(id); // 현재 구매 내역 정
		
		HttpSession session = request.getSession();
		
		if( payment != null && payment.getP_cnt()>0 && payment.getP_use_cnt() !=0) {
			session.setAttribute("msg", "이용권이 이미 있습니다.");
			response.sendRedirect(request.getContextPath() + "/menu/buyTicket");
		}else {
			session.setAttribute("msg", "구매 완료 !");
			response.sendRedirect(request.getContextPath() + "/menu/buyTicket");
		}


		// Gson 객체 생성

		// 맵을 JSON 데이터로 변환


	}

}
