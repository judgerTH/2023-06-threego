<%@page import="com.threego.app.msgbox.model.vo.MsgConfirm"%>
<%@page import="com.threego.app.msgbox.model.vo.MsgBox"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    <%
    	
    	String memberId = loginMember.getId();
    	//List<MsgBox> msgBoxes = (List<MsgBox>) session.getAttribute("msgBoxes");
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
     <style>
    	div#pagebar{margin-top:5px; text-align:center; background-color:rgba(0, 0, 0, 0.03); width: 1250px;}
		div#pagebar a{margin-right: 5px; color: green; font-size: 20px}
    </style>
</head>
<body>
      
    <div class="mypage-container" style="height:fit-content">
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
									href="<%= request.getContextPath() %>/rider/requestCollectionList">수거 접수
										리스트</a></li>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/rider/riderCollectionListCheck">나의
										수거 목록 조회</a></li>
								<% } %>
                        		<li class="active"><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/notebox?memberId=<%= memberId %>">📑받은 메시지</a></li>
                    </ul>
                </div>
         
            <div class="right-div" style="height:fit-content;">
                <h3>받은 메시지</h3>
                <% if(msgBoxes != null && !msgBoxes.isEmpty()) { %>
                	<% for(MsgBox msgBox : msgBoxes) { %>
                	<% if(msgBox.getMsgConfirm() == MsgConfirm.O) {%>
		                <div class="letterBox" style="color:grey;">
		            <% } else { %>
		            	<div class="letterBox">
		            <% } %>
		                	<div >
		                		<p class="letterIcon" style="">✉️</p>
		                	</div>
		                	<div class="letterContent">
		                		<div style="display:flex;">
			                		<span style="font-size:13px;">보낸사람 : 관리자 &nbsp;&nbsp;&nbsp; 전송일자 : <%= msgBox.getMsgSendingDate() %></span>
			                		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                		<% if(msgBox.getMsgConfirm() == MsgConfirm.O) {%>
			                			<button id="noteBoxCheck" style="display:none; font-size:13px; border-radius:10px; background-color:white;">확인</button>
			                			<form action="<%= request.getContextPath() %>/member/noteBoxConfirm" id="msgCheckFrm" name="msgCheckFrm" method="post">
			                			<input type="hidden" id="msgNo" name="msgNo" value="<%= msgBox.getMsgNo() %>">
			                			<input type="hidden" id="msgReceiver" name="msgReceiver" value="<%= msgBox.getMsgReceiver() %>">
			                			
			                		</form>
			                		<% } else { %>
			                		<form action="<%= request.getContextPath() %>/member/noteBoxConfirm" id="msgCheckFrm" name="msgCheckFrm" method="post">
			                			<input type="hidden" id="msgNo" name="msgNo" value="<%= msgBox.getMsgNo() %>">
			                			<input type="hidden" id="msgReceiver" name="msgReceiver" value="<%= msgBox.getMsgReceiver() %>">
				                		<button id="noteBoxCheck" style="font-size:13px; border-radius:10px; background-color:white;">확인</button>
			                			
			                		</form>
			                		<% } %>
		                		</div>
		                		<p><%= msgBox.getMsgContent() %></p>
		                	</div>
		                </div>
		                <br>
               		<% } %>
                <% } else { %>
                	<div class="letterBox">받은 메시지가 없습니다</div>
                <% } %>
            </div>
       </div>
    	
     </div>
<script>
	document.querySelectorAll("#noteBoxCheck").forEach((item) => {
		item.onclick = (e) => {
			if(confirm('확인하셨습니까?')) {
				const frm = $("#msgCheckFrm");
				const hiddenVal = document.querySelector("#msgNo");
				const hiddenVal2 = document.querySelector("#msgReceiver");
					
				console.log(hiddenVal.value);
				console.log(hiddenVal2.value);
				frm.submit();
					
			} else {
				return false;
			}
		};       
	});
	 
</script>
</body>
</html>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>