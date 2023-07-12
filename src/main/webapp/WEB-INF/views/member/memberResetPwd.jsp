<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />
</head>
<body>
<div class="search-wrapper">
        <div class="search-subwrapper">
            <h2>비밀번호 재설정</h2>
            <p>비밀번호를 재설정하시기 바랍니다.</p>
            <form action = "<%=request.getContextPath()%>/member/MemberResetPwd" method= "POST">
            <input type="password" class= "search-input" name="reset-pwd" id="reset-pwd" placeholder="재설정 비밀번호">
            <input type="password" class= "search-input" name="reset-pwd-confirm" id="reset-pwd-confirm">
            <button id="btn-searchId">비밀번호 재설정</button>
            </form>
        </div>
</div>

</body>
</html>