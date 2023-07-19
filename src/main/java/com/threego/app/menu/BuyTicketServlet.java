package com.threego.app.menu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.member.model.vo.Member;
import com.threego.app.payment.model.service.PaymentService;
import com.threego.app.payment.model.vo.Payment;

/**
 * Servlet implementation class BuyTicketServlet
 */
@WebServlet("/menu/buyTicket")
public class BuyTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PaymentService paymentService = new PaymentService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		//String id = request.getParameter("")
		
		String id = loginMember.getId();
	
		Payment payment = paymentService.findPayment(id);
		
//		System.out.println(loginMember);
//		System.out.println(id + "   " +payment);
		
		request.setAttribute("payment", payment);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/menu/buyTicket.jsp");
		reqDispatcher.forward(request, response);
	}

}
