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
        
        
        // 응답 처리 등
        response.setContentType("application/json; charset=utf-8");
        
        Map<String, Object> map = new HashMap<>();
        map.put("result","성공적으로 구매가 완료되었습니다.");

        // Gson 객체 생성
        Gson gson = new Gson();

        // 맵을 JSON 데이터로 변환
        gson.toJson(map, response.getWriter());
        response.sendRedirect(request.getContextPath() + "/menu/buyTicket");

        
	}

}
