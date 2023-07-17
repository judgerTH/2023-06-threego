package com.threego.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.admin.model.service.AdminService;
import com.threego.app.member.model.vo.Member;

/**
 * Servlet implementation class AdminFindByNameServlet
 */
@WebServlet("/admin/findByName")
public class AdminFindByNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberName = request.getParameter("findByName");
		
		List<Member> members = adminService.findByName(memberName);
		
		request.setAttribute("members", members);
		request.getRequestDispatcher("/WEB-INF/views/admin/userList.jsp")
		.forward(request, response);
	}

}
