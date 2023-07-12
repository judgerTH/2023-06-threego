package com.threego.app.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		int lastMonthPayment = adminService.getlastMonthPayment();
		request.setAttribute("lastMonthPayment", lastMonthPayment);
		
		int thisMonthPayment= adminService.getthieMonthPayment();
		request.setAttribute("thisMonthPayment", thisMonthPayment);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/adminMain.jsp")
		.forward(request, response);
	}

}
