<%@page import="com.threego.app.member.model.vo.MemberRole"%>
<%@page import="com.threego.app.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />

<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
</head>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<body>


<header>
    <div class="header">
        <!--로고 및 메뉴바 -->
        <header id = "nav">

            <div><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/images/threegoLogo.png" alt="threego-Logo" style = "width : 120px; height: 120px;"></a></div>

            <div id="menu-container">
                <ul id = "menubar">
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/serviceIntroduction">서비스소개</a></li>
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/information">이용안내</a></li>
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/buyTicket">수거신청</a></li>
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/riderApplication">라이더 지원</a></li>
                    <li class="nav-item"><a href="">고객센터</a></li>
                </ul>
            </div>
            <!--로고 및 메뉴바 끝-->
            <!--로그인, 회원가입 버튼 -->
            <div id="enterance">
            <% if(loginMember != null){ 
            		if(loginMember.getMemberRole()==MemberRole.U || loginMember.getMemberRole()==MemberRole.R){
            
            %>
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
        </header>
    </div>
</header>



</body>
</html>