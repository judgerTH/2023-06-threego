<%@page import="com.threego.app.ticket.model.vo.TicketPayment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    <% 
   		 String memberId = loginMember.getId();
    	List<TicketPayment> requestList = (List<TicketPayment>) request.getAttribute("requestList");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member_page.css" />  
</head>
<body>
    <div id="wrapper">
        <div id="container_wr">
        <div id="container">
    <div class="mypage-wrap">
        <div class="container">
            <div>
                <div class="left-div">
                <h2>마이페이지</h2>
                    <ul>
                        <li class="active"><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/myPage">회원정보 수정</a></li>
                       			<li><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/requestList?memberId=<%= memberId %>">결제정보</a></li>
                        		<li><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/notebox">📑받은 메시지</a></li>
								<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.U){ %>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/member/requestList">수거신청
										내역</a></li>
								<% } else if(loginMember != null && loginMember.getMemberRole() == MemberRole.R) { %>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/rider/requestCollectionList">수거
										리스트</a></li>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/rider/riderCollectionListCheck">나의
										수거 목록 조회</a></li>
								<% } %>
                    </ul>        
                </div>
            </div>
            </div>
            <div class="right-div">
                <h3>결제정보</h3>
                <table class="mypage-table">
                    <tbody>
                        <tr>
                            <td>이용권명</td>
                            <td>결제금액</td>
                            <td>결제일</td>
                            <td>잔여 이용권</td>
                        </tr>
                        <tr>
                   		<% if(requestList.isEmpty() || requestList == null) { %>
                        	<td colspan="7" class="empty_table">주문 내역이 없습니다.</td>
                        </tr>
                        <% } else {
                        			for(TicketPayment reqList : requestList) {	 %>
                        <tr>
                        <td><%= reqList.getTicName()%></td>
                        <td><%= reqList.getTicPrice() %></td>
                        <td><%= reqList.getpDate() %></td>
                        <td><%= reqList.getpCnt() %></td>
                        <% 		}
                        		}
                       	%>
                        </tr>           
                     </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>