<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쓰레기 수거 웹사이트</title>
</head>
<body>
    <h1>쓰레기 수거 웹사이트에 오신 것을 환영합니다!</h1>
    <p>이 웹사이트는 회원제로 운영되며, 쓰레기 수거 서비스를 제공합니다.</p>
    
    <h2>회원 가입</h2>
    <p>아직 회원이 아니신가요? 회원 가입을 통해 웹사이트의 모든 기능을 이용할 수 있습니다.</p>
    <a href="register.jsp">회원 가입</a>
    
    <h2>로그인</h2>
    <p>이미 회원이신가요? 로그인을 통해 웹사이트에 접속하세요.</p>
    <form action="loginProcess.jsp" method="POST">
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" required><br>
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="로그인">
    </form>
    
    <h3>아이디/비밀번호 찾기</h3>
    <p>아이디 또는 비밀번호를 잊으셨나요? 아래 링크를 통해 아이디와 비밀번호를 찾을 수 있습니다.</p>
    <a href="findId.jsp">아이디 찾기</a> | <a href="findPassword.jsp">비밀번호 찾기</a>
    
    <nav>
        <ul>
            <li>
                <a href="#">1. 소개</a>
                <ul>
                    <li><a href="usageGuide.jsp">이용 안내</a></li>
                    <li><a href="websiteIntro.jsp">홈페이지 소개</a></li>
                </ul>
            </li>
            <li>
                <a href="#">2. 이용</a>
                <ul>
                    <li><a href="usageFee.jsp">이용 요금</a></li>
                    <li><a href="trashRequest.jsp">수거 신청</a></li>
                    <li><a href="collectionStatus.jsp">수거 현황</a></li>
                </ul>
            </li>
            <li>
                <a href="#">3. 고객센터</a>
                <ul>
                    <li><a href="inquiry.jsp">1:1 문의사항</a></li>
                    <li><a href="notice.jsp">공지사항</a></li>
                </ul>
            </li>
            <li><a href="reviews.jsp">4. 이용후기</a></li>
        </ul>
    </nav>
</body>
</html>