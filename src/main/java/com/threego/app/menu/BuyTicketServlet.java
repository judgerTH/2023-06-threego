package com.threego.app.menu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.member.model.service.MemberService;
import com.threego.app.member.model.vo.Member;

/**
 * Servlet implementation class BuyTicketServlet
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
		
	    String ticId = req.getParameter("ticId");
	    String pMemId = req.getParameter("memberId");
	    
	    System.out.println(pMemId);
//	    System.out.println("zzzz");
	    
	    
	    
	    
	    
	    System.out.println(ticId);
	    req.setAttribute("ticId", ticId);
	    
	    

	    
	    // 페이지 포워딩
	    req.getRequestDispatcher("/WEB-INF/views/menu/buyTicket.jsp").forward(req, resp);
	}

}
