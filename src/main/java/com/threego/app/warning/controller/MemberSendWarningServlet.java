package com.threego.app.warning.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.warning.model.service.WarningService;
import com.threego.app.warning.model.vo.Warning;

/**
 * Servlet implementation class MemberSendWarningServlet
 */
@WebServlet("/warning/memberSendwarning")
public class MemberSendWarningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final WarningService warningService = new WarningService();   
  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    String warningWriter = request.getParameter("memberId");
	    int warningReqNo = Integer.parseInt(request.getParameter("reqNo"));
	    String warningContent = request.getParameter("warningReason");
	    Warning warning = new Warning(0, warningReqNo, warningWriter, warningContent, null, 0, null);
	    
	    int result = warningService.insertWarning(warning);
	    HttpSession session = request.getSession();

	    // 사용자 피드백 및 리다이렉트 처리
	    response.sendRedirect(request.getContextPath() + "/member/myPage");
	}

}
