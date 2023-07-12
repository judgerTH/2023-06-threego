<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file = "/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<style>
h3  { text-align: center; color: #232324; font-size: 30px; font-weight: 700  line-height: 0.5; }
p  { text-align: center; color: #232324; font-size: 20px; font-weight: 700; line-height: 1.0; }
.page-heading  { margin-top: 40px; padding: 0 24px; text-align: center; color: #232324; font-size: 16px; font-weight: 400; line-height: 1.75; word-break: keep-all; margin-bottom: 40px; }
span { color: #49B466; }
hr { width: 70%; height: 1px; background-color: #49B466; }
.row { --bs-gutter-x: 1.5rem; --bs-gutter-y: 0; display: flex; flex-wrap: wrap; margin-top: calc(-1 * var(--bs-gutter-y));  margin-right: 20%; margin-left: 20%; justify-content: space-between!important; }
.service-img { vertical-align: middle; margin-left: 15%; width: 70vw; height: 450px; }
</style>
<body>
    <!-- 메인메뉴바 / 서비스 소개 페이지-->
	<div class="menu-wrapper">
	
	<!--
	 	 시간나면 이미지 놀거임 
	  -->
	  <img src="<%= request.getContextPath() %>/images/serviceIntroduction.png" alt="서비스소개배너" class="service-img">
	
    <h3>쓰리고 (ThreeGo)</h3>
    <p>환경부담 줄이<span>GO</span>, 재활용 높이<span>GO</span>, 돈도 벌<span>GO</span></p>
    
	    <div class="page-heading">
	    <hr><br>
	    모두가 분리수거를 하는 세상, 꿈꿔본 적 있나요? 
	    <br>
	    누군가 상상만 했던 일을 오늘도 하는 기업이 여기 있습니다.
	    <br>
	    우리가 그동안 알지 못했고, 혹은 당연한 듯 불편하게 느껴진 "버리는 것"에 집중한 최초의 서비스입니다.
	
	    <p>쓰리고와 함께하세요</p>
	    쓰리고는 사용자들에게 책임감있는 소비 습관을 실천할 수 있는 기회를 제공합니다.
	    <br>
	    환경을 보호하고 재활용을 실천하며 미래 세대를 위한 지속 가능한 사회를 만들기 위해 쓰리고와 함께하세요.
	    <br>
	    분리수거 서비스를 이용하여 보다 효율적이고 친환경적인 생활을 실천하고 환경 보호에 기여해보세요.
	    <br><br>
	    </div>  
	    
    </div>
</body>
</html>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>