package com.threego.app.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.threego.app.member.model.vo.Member;


/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter({ 
	"/member/notebox",
	"/member/myPage",
	"/rider/requestCollectionList",
	"/rider/riderCollectionListCheck",
	"/member/memberDetail", 
	"/member/memberUpdate", 
	"/member/memberDelete",
	"/board/boardCreate",
	"/board/boardUpdate",
	"/board/boardDelete",
	"/board/boardCommentCreate",
	"/board/boardCommentUpdate",
})
public class LoginFilter extends HttpFilter implements Filter {
       

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpReq = (HttpServletRequest) request; 
		HttpServletResponse httpRes = (HttpServletResponse) response; 
		
		HttpSession session = httpReq.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		if(loginMember == null) {
			session.setAttribute("msg", "로그인후 이용하실수 있습니다.");
			httpRes.sendRedirect(httpReq.getContextPath() + "/");
			return;
		}

		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
