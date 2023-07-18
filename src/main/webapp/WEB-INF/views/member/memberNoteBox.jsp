<%@page import="com.threego.app.msgbox.model.vo.MsgBox"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    <%
    	String memberId = loginMember.getId();
    	List<MsgBox> msgBoxes = (List<MsgBox>) request.getAttribute("msgBoxes");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쓰리고 | 회원정보수정</title>
    <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
     <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member_page.css" />
</head>
<body>
        <div id="container">
    <div class="mypage-wrap">
        <div class="container">
            <div>
                <div class="left-div">
                <h2>마이페이지</h2>
                    <ul>
                        <li><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/myPage">회원정보 수정</a></li>
								<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.U){ %>
                       			<li><a class="" aria-current="page"
                       				href="<%= request.getContextPath() %>/member/paymentList?memberId=<%= memberId %>">결제정보</a></li>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/member/requestList?memberId=<%= memberId %>">수거신청내역</a></li>
								<% } else if(loginMember != null && loginMember.getMemberRole() == MemberRole.R) { %>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/rider/requestCollectionList">수거
										리스트</a></li>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/rider/riderCollectionListCheck">나의
										수거 목록 조회</a></li>
								<% } %>
                        		<li class="active"><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/notebox?memberId=<%= memberId %>">📑받은 메시지</a></li>
                    </ul>
                </div>
            </div>
            </div>
            <div class="right-div">
                <h3>받은 메시지</h3>
                <div class="letterBox">
                	<div >
                		<p class="letterIcon" style="">✉️</p>
                	</div>
                	<div class="letterContent">
                		<p style="font-size:13px;">보낸사람 : 관리자 &nbsp;&nbsp;&nbsp; 전송일자 : 2023-07-18</p>
                		<p>수고미 반려되었습니다.</p>
                	</div>
                </div>
                <!-- <table class="mypage-table" style="width:1200px;">
                    <tbody>
                        <tr>
                            <td style="width:50px;">NO</td>
                            <td style="width:100px;">보낸사람</td>
                            <td style="width:100px;">보낸시간</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                        	<% if(msgBoxes != null && !msgBoxes.isEmpty()) { %>
                        		<% for(MsgBox msgBox : msgBoxes) { %>
                        			<% int i = 1; %>
                        			<td><%= i++ %></td>
                        			<td>관리자</td>
                        			<td><%= msgBox.getMsgSendingDate() %></td>
                        			<td><%= msgBox.getMsgContent() %></td>
                        		<% } %>
                        	<% } else { %>
                        		<td colspan="4" class="empty_table">받은 메시지가 없습니다.</td>
                        	<% } %>
                        </tr>           
                     </tbody>
                </table> -->
            </div>
        </div>
    </div>
</body>
</html>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>