package com.threego.app.menu;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.member.model.service.MemberService;
import com.threego.app.member.model.vo.Member;
import com.threego.app.member.model.vo.Payment;

/**
 * Servlet implementation class PickupTrashServlet
 */
@WebServlet("/menu/buyTicket")
public class BuyTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/menu/buyTicket.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
//		String id = req.getParameter("id");
//		String name = req.getParameter("name");
//		String address = req.getParameter("address");
//		Member member = new Member();
//		
//		member.setId(id);
//		member.setName(name);
//		member.setAddress(address);
//		
//		
//		
//		System.out.println();
//		
//		
//		Member loginMember = memberService.findById(id);
//		
//		HttpSession session = req.getSession();
//		
//		session.setAttribute("loginMember", loginMember);
//		
//		
//		resp.setCharacterEncoding("utf-8");
//		resp.getWriter().append("구매신청 완료 !");
		
		
	}
}
