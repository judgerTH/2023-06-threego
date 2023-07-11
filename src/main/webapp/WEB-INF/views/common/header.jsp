<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />
</head>
<body>

<header>
    <div class="header">
        <!--로고 및 메뉴바 -->
        <header id = "nav">
            <div><a href=""><img src="<%=request.getContextPath()%>/images/threegoLog.png" alt="threego-Logo" style = "width : 120px; height: 120px;"></a></div>
            <div id="menu-container">
                <ul id = "menubar">
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/serviceIntroduction">서비스소개</a></li>
                    <li class="nav-item"><a href = "<%= request.getContextPath() %>/menu/information">이용안내</a></li>
                    <li class="nav-item"><a href = "">수거신청</a></li>
                    <li class="nav-item"><a href = "">라이더 지원</a></li>
                    <li class="nav-item"><a href="">고객센터</a></li>
                </ul>
            </div>
            <!--로고 및 메뉴바 끝-->
            <!--로그인, 회원가입 버튼 -->
            <div id="enterance">
                <div class = "ent-button" id="login">
                    <a href=""><img src="<%=request.getContextPath()%>/images/login.png" alt="login-icon" class = "ent-img" id = "btn-login"></a>
                    <span>로그인</span>
                </div>
                <div class = "ent-button" id="enroll">
                    <a href=""><img src="<%= request.getContextPath()%>/images/add-user.png" alt="enroll-icon" class = "ent-img" id="btn-enroll"></a>
                    <span>회원가입</span>
                </div>
            </div>
            <!--로그인, 회원가입 버튼 끝 -->
        </header>
    </div>
</header>



</body>
</html>