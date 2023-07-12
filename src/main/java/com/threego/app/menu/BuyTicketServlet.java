package com.threego.app.menu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PickupTrashServlet
 */
@WebServlet("/menu/buyTicket")
public class BuyTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.getRequestDispatcher("/WEB-INF/views/menu/buyTicket.jsp").forward(req, resp);
		}
}
