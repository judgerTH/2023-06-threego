<%@page import="com.threego.app.msgbox.model.vo.MsgConfirm"%>
<%@page import="com.threego.app.msgbox.model.vo.MsgBox"%>
<%@page import="java.util.List"%>
<%@page import="com.threego.app.member.model.vo.MemberRole"%>
<%@page import="com.threego.app.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	Member loginMember = (Member)session.getAttribute("loginMember");
	List<MsgBox> msgBoxes = (List<MsgBox>) session.getAttribute("msgBoxes");
String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg"); // 1회용
	
%>

	
<script>
<% 	if(msg != null) { %>
alert('<%= msg %>');
<% 	} %>
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
<% 	if(loginMember != null) { %>
	<script src="<%= request.getContextPath() %>/js/ws.js"></script>		
<% 	} %>
</head>
<body>


<div class="header-container">
    <div class="header">
        <!--로고 및 메뉴바 -->
        <div id = "nav">

            <div><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/images/threegoLogo.png" alt="threego-Logo" style = "width : 120px; height: 120px;"></a></div>

            <div id="menu-container">

                <ul id = "menubar" style = "font-family: 'GmarketSansMedium'; color:black;">
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/serviceIntroduction" style = "color : black;">서비스소개</a></li>
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/information" style = "color : black;">이용안내</a></li>
                     <%if(loginMember!=null && loginMember.getMemberRole()== MemberRole.R ){ %>
                     <li class="nav-item"><a href = "<%= request.getContextPath() %>/rider/requestCollectionList">수거 리스트 조회</a></li><%}else{ %>
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/buyTicket" style = "color : black;">수거신청</a></li>
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/riderApplication" style = "color : black;">수고미 지원</a></li><%} %>
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/serviceCenter" style = "color : black;">고객센터</a></li>
                </ul>
            </div>
            <!--로고 및 메뉴바 끝-->
            <!--로그인, 회원가입 버튼 -->
            <div id="enterance"  style = "font-family: 'GmarketSansMedium';">
            <% if(loginMember != null){ 
            		if(loginMember.getMemberRole()==MemberRole.U || loginMember.getMemberRole()==MemberRole.R){
            
            %>
            <%  if(msgBoxes != null && !msgBoxes.isEmpty()) { %>
            	<% int cnt = 0; %>
            	<% for(MsgBox msgBox : msgBoxes) { %>
            		<% if(loginMember.getId().equals(msgBox.getMsgReceiver())) {%>
            			<% if(msgBox.getMsgConfirm() == MsgConfirm.X) { %>
            			<% cnt++; %>
            			<% } %>
            		<% } %>
            	<% } %>
            	<% if(cnt > 0) { %>
			         <div id="msgCheckBox" style="border:1px solid black; border-radius:20px; width:260px; height:45px; margin-right:10px; margin-top:10px; padding-top:20px; text-align:center;">
			            <a href="<%= request.getContextPath() %>/member/notebox?memberId=<%= loginMember.getId()%>">확인하지 않은 메세지가 있습니다.</a>
			         </div>
			    <% } %>
            	
            	
            <% } %>
                <div id="alarmBox" style="display:none; width:30px; padding-top:10px; padding-right:20px;">
                    <span>
                    	<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-envelope-open-heart" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M8.47 1.318a1 1 0 0 0-.94 0l-6 3.2A1 1 0 0 0 1 5.4v.817l3.235 1.94a2.76 2.76 0 0 0-.233 1.027L1 7.384v5.733l3.479-2.087c.15.275.335.553.558.83l-4.002 2.402A1 1 0 0 0 2 15h12a1 1 0 0 0 .965-.738l-4.002-2.401c.223-.278.408-.556.558-.831L15 13.117V7.383l-3.002 1.801a2.76 2.76 0 0 0-.233-1.026L15 6.217V5.4a1 1 0 0 0-.53-.882l-6-3.2ZM7.06.435a2 2 0 0 1 1.882 0l6 3.2A2 2 0 0 1 16 5.4V14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5.4a2 2 0 0 1 1.059-1.765l6-3.2ZM8 7.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
						</svg>
                    </span>					
                </div>
             	<div class = "ent-button" id="mypage">
    				<a href="<%= request.getContextPath() %>/member/myPage"><img src="<%=request.getContextPath()%>/images/mypageicon.png" alt="mypage-icon" class = "ent-img" id = "btn-mypage"></a>
                    <span>마이페이지</span>
                </div>
                
                
                	<%} else if(loginMember.getMemberRole()==MemberRole.A){ %>
                	<div class = "ent-button" id="adminpage">
    				<a href="<%=request.getContextPath() %>/admin/adminMain" target="_blank"><img src="<%=request.getContextPath()%>/images/admin.png" alt="mypage-icon" class = "ent-img" id = "btn-adminpage"></a>
                    <span>관리자페이지</span>
                	</div>
                	<% } %>
                
                <div class = "ent-button" id="logout">
                    <a href="<%=request.getContextPath()%>/member/memberLogout"><img src="<%= request.getContextPath()%>/images/logout.png" alt="logout-icon" class = "ent-img" id="btn-logout"></a>
                    <span>로그아웃</span>
                </div>
             
             <% } else{ %>
                <div class = "ent-button" id="login">
    				<a href="<%= request.getContextPath()%>/member/memberLogin"><img src="<%=request.getContextPath()%>/images/login.png" alt="login-icon" class = "ent-img" id = "btn-login"></a>
                    <span>로그인</span>
                </div>
                <div class = "ent-button" id="enroll">
                    <a href="<%= request.getContextPath()%>/member/memberEnroll"><img src="<%= request.getContextPath()%>/images/add-user.png" alt="enroll-icon" class = "ent-img" id="btn-enroll"></a>
                    <span>회원가입</span>
                </div>
             
             <% } %>
            </div>
            <!--로그인, 회원가입 버튼 끝 -->
        </div>
    </div>
</div>



</body>
</html>