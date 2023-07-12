package com.threego.app.admin.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.threego.app.admin.model.service.AdminService;



public class SessionListener implements HttpSessionListener {

   
    public void sessionCreated(HttpSessionEvent se)  {
    	
    	// 세션이 새로 생성되면 execute() 실행한다.
        if(se.getSession().isNew()){
            execute(se);
        }
    }
    
    private void execute(HttpSessionEvent sessionEve) {
    	
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
    	
    	HttpSession session = sessionEve.getSession();
    	
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
