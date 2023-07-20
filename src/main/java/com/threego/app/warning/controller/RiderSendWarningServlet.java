package com.threego.app.warning.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.member.model.vo.MemberRole;
import com.threego.app.warning.model.service.WarningService;
import com.threego.app.warning.model.vo.WarnigMemberRole;
import com.threego.app.warning.model.vo.Warning;

/**
 * Servlet implementation class RiderSendwarningServlet
 */
@WebServlet("/warning/riderSendwarning")
public class RiderSendWarningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final WarningService warningService = new WarningService();
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String WarningWriter= request.getParameter("riderId");
		int WarningReqNo = Integer.parseInt(request.getParameter("reqNo")) ;
		String  WarningContent = request.getParameter("warningReason");
		Warning warning = new Warning(0, WarningReqNo, WarningWriter, WarningContent, null, 0, null);
		
		int result = warningService.insertWarning(warning);
		HttpSession session = request.getSession();

		// 4. 사용자피드백 및 리다이렉트 처리
		session.setAttribute("msg", "신고요청이 접수되었습니다.");

		response.sendRedirect(request.getContextPath() + "/rider/riderCollectionListCheck");
		
	
		
	}

}
