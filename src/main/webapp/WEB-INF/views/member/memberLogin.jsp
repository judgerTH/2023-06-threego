<%@page import="com.threego.app.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginMember</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />
</head>
<%
	String msg = (String)session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<script>
window.onload = () => {
	<% if(msg != null){ %>
		alert("<%=msg%>");
	<% } %>
}

</script>

<body>
	<div class="main_wrap" id="login_new">
        <div class="sub_div">
            <div class="login_div">
    
                <div class="login_wrap">
                    <form action="<%=request.getContextPath()%>/member/memberLogin" name = "LoginFrm" class="login-form" method = "POST">
                        <fieldset id ="login-fieldset">
                            <a href="http://localhost:8080/threego"><img src="<%=request.getContextPath()%>/images/threegoLogo.png" alt="threego logo" id = "login_logo"/></a>
                            <table id= "login-tbl">
                                <tr>
                                    <td>
                                        <input class = "login-input" type="text" name="login-id" id="login-id" placeholder="아이디">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input class = "login-input" type="password" name="login-pwd" id="login-pwd" placeholder="비밀번호">
                                    </td>
                                </tr>
                            </table>
                            <div class="btn-loginMem-wrap">
                                <button type="submit" class = "btn-loginMem" name = "btn-login" id="btn-login">로그인</button>
                                <button type = "button" class = "btn-loginMem" name = "btn-enroll" id = "btn-enroll" onclick = "location.href='<%= request.getContextPath()%>/member/memberEnroll'">회원가입</button>
                            </div>
                        </fieldset>
                    </form>
                    <div class = "searchInfo" name = "searchInfo" id = "searchInfo">
                       <a onclick = "searchID();">아이디찾기</a>
                       |
                       <a onclick = "searchPWD();">비밀번호찾기</a>
                    </div>
                </div>
        
            </div>
    
    
        </div>
    </div>
	<form name = "searchIdFrm" action = "<%= request.getContextPath()%>/member/MemberSearchId"></form>
	<form name = "searchPwdFrm" action = "<%= request.getContextPath()%>/member/memberSearchPwd"></form>
</body>

<script>

const searchID = () =>{
	
	const title = "searchIDPopup";
	const popup = open("", title, "width = 700px, height = 500px");
	
	const frm = document.searchIdFrm;
	frm.target = title;
	frm.submit();
	
}

const searchPWD = () => {
	
	const title = "searchPwdPopup";
	const popup = open("", title, "width = 700px, height = 500px");
	
	const frm = document.searchPwdFrm;
	frm.target = title;
	frm.submit();
	
}


</script>


</html>