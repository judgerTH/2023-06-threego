package com.threego.app.menu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServiceIntroductionServlet
 */
@WebServlet("/menu/serviceIntroduction")
public class ServiceIntroductionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 메인메뉴바 -> 서비스소개 서블릿
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/menu/serviceIntroduction.jsp");
		reqDispatcher.forward(request, response);
	}

}
