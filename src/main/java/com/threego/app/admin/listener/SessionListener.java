package com.threego.app.admin.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.threego.app.admin.model.dao.AdminDao;
import com.threego.app.admin.model.service.AdminService;



public class SessionListener implements HttpSessionListener {

   
    public void sessionCreated(HttpSessionEvent se)  {
    	
    	AdminService adminService = new AdminService();
    	
    	// 전체 방문자 수 +1
    	adminService.setVisitTotalCount();
         
        // 오늘 방문자 수
        int todayCount = adminService.getVisitTodayCount();
        
        // 어제 방문자 수
        int yesterdayCount = adminService.getVisitYesterdayCount();
        
        // 그제 방문자 수
        int twoDayAgoCount = adminService.getVisitTwoDayAgoCount();
        
        // 3일전 방문자 수
        int threeDayAgoCount = adminService.getVisitThreeDayAgoCount();
        
        // 전체 방문자 수
//        int totalCount = adminService.getVisitTotalCount();
         
        HttpSession session = se.getSession();
         
        // 세션 속성에 담아준다.
//        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
        session.setAttribute("yesterdayCount", yesterdayCount); // 어제 방문자 수
        session.setAttribute("twoDayAgoCount", twoDayAgoCount); // 그제 방문자 수
        session.setAttribute("threeDayAgoCount", threeDayAgoCount); // 3일전 방문자 수
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}
