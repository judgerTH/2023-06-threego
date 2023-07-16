 package com.threego.app.request.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.request.model.service.RequestService;

/**
 * Servlet implementation class RiderAcceptRequestServlet
 */
@WebServlet("/request/acceptRequest")
public class RiderAcceptRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final RequestService requestService = new RequestService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String req = request.getParameter("reqNo");
		System.out.println(req);
		
		// request.setAttribute("reqNo", reqNo);
		
		// Request request = new Re
		
		request.getRequestDispatcher("/WEB-INF/views/request/RequestListView.jsp").forward(request, response);
		
		//int result = requestService.acceptRequest();
		
		
		
	}

}
