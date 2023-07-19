<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Threego</title>
<style>
#main-info-container{display : flex; width : 100vw; flex-direction : column; align-items : center;}
#main-info{width : 1090px; margin : 30px 0px; display : flex; flex-direction : column; justify-content : center; }
.main-use-img{width : 350px; height : 400px; }
#main-info-card{display : flex; flex-direction: row; justify-content : center; text-align: center;}
.main-info-num {font-weight : bold; color :  #49B466;}
.main-info-content{ font-size : 20px;}
.main-info-img{border :none; margin-left : 30px; border-radius : 10px; box-shadow: 5px 7px 10px 5px #d2d2d2 }

.service-img {width: 600px; height : 450px; border :none; border-radius : 10px; box-shadow: 5px 7px 10px 5px #d2d2d2}
#service-section{width: 1090px; margin : 50px 10px; }
#servie-img-wrapper{display : flex; justify-content : center; text-align:center;}

#btn-container{margin-bottom : 50px;}
</style>
</head>
<body>

<main>

    <div id="main-info-container">
        <img src="<%=request.getContextPath()%>/images/mainbanner_new.png" alt="메인배너" class="main-img">
        <div id = "main-info">
        	<h2 style = "color : #468B97; font-size : 40px; font-style :italic; font-family: 'TTWanjudaedunsancheB';">Three Go는요!</h2>
        	<div id = "main-info-card">
	        	<div class= "main-info-img" id = "main-info-img1">
		        	<p class= "main-info-content"><span class = "main-info-num">01.</span> 수거 신청 후 문 앞에 두면</p>
		        	<img src="<%=request.getContextPath()%>/images/mainuse1.png" alt="메인이용1" class="main-use-img">
	        	</div>
	        	<div class= "main-info-img" id = "main-info-img2">
		        	<p class= "main-info-content"><span class = "main-info-num">02.</span> 쓰리고의 수고미가</p>
		        	<img src="<%=request.getContextPath()%>/images/mainuse2.png" alt="메인이용2" class="main-use-img">
	        	</div>
	        	
	        	<div class= "main-info-img" id = "main-info-img3">
		        	<p class= "main-info-content"><span class = "main-info-num">03.</span> 대신 깨끗하게 수거해드립니다!</p>
		        	<img src="<%=request.getContextPath()%>/images/mainuse3.png" alt="메인이용3" class="main-use-img">
	        	</div>
        	
        	</div>
        </div>
		<div id="service-section">
		<h2 style = "color : #468B97; font-size : 40px; font-style :italic; font-family: 'TTWanjudaedunsancheB';">서비스 이용 가능 지역</h2>
		<div id="servie-img-wrapper">
			<img src="<%=request.getContextPath()%>/images/service_section.png" alt="서비스이용가능지역" class="service-img">
		</div>
		</div>
        <div id = "btn-container">
            <div><a href = "<%= request.getContextPath() %>/menu/buyTicket"><button class="btn-main">수거 신청</button></a></div>
            <div><a href = "<%= request.getContextPath() %>/menu/riderApplication"><button class="btn-main">라이더 지원</button></a></div>
            
        </div>
    </div>
</main>

</body>
</html>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
