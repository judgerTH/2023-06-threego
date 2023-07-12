<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />
<title>아이디 찾기</title>
</head>
<body>
	<div class="search-wrapper">
        <div class="search-subwrapper">
            <h2>아이디 찾기</h2>
            <p>아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</p>
            <p id = "confirm-id"></p>
            <form action="<%=request.getContextPath()%>/member/MemberSearchId" name = "LoginFrm" id = "LoginFrm" method="POST">
            <input type="text" class= "search-input" name="email" id="email" placeholder="등록하신 이메일">
            <button type = "submit" id="btn-searchId">찾기</button>
            </form>
        </div>
    </div>

</body>

</html>