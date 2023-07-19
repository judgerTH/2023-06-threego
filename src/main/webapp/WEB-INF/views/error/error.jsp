<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%--
	에러페이지 설정 
	- page지시어 isErrorPage="true"
	- 발생한 예외객체에 exception변수명으로 선언없이 접근 가능
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<style>
body {text-align: center; margin-top:50px;}
h1 {font-size: 250px; margin: 0;}
a {font-size : 30px; text-decoration:none; color:green;}
a:hover {color:black;}
</style>
</head>
<body>

	<img src="<%= request.getContextPath() %>/images/errorPage.png">
	<br><br><br>
	<h2>이용에 불편을 드려 죄송합니다.</h2>
	<p><a href="<%= request.getContextPath() %>/">홈으로</a></p> 
</body>
</html>


