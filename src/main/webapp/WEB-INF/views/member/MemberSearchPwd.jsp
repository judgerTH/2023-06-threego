<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />
</head>
<body>
<div class="search-wrapper">
        <div class="search-subwrapper">
            <h2>비밀번호 찾기</h2>
            <p>비밀번호는 가입시 입력하신 아이디와 이메일을 통해 찾을 수 있습니다.</p>
            <form action = "<%=request.getContextPath()%>/member/MemberSearchPwd" method= "POST">
            <input type="text" class= "search-input" name="search-id" id="search-id" placeholder="가입한 아이디">
            <input type="text" class= "search-input" name="email" id="email" placeholder="등록한 이메일">
            <p id = "check-search"></p>
            <button id="btn-searchId">찾기</button>
            </form>
        </div>
</div>

</body>
</html>