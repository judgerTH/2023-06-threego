<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Threego</title>
</head>
<body>

<main>
    <div class="main-container">
        <img src="<%=request.getContextPath()%>/img/메인 이미지.jpg" alt="메인배너" class="main-img">
        <div id = "btn-container">
            <div><a href = "<%= request.getContextPath() %>/menu/buyTicket"><button class="btn-main">수거 신청</button></a></div>
            <div><a href = "<%= request.getContextPath() %>/menu/riderApplication"><button class="btn-main">대호 지원</button></a></div>
            
            
        </div>
    </div>
</main>

</body>
</html>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
