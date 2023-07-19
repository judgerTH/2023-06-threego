<%@page import="com.threego.app.member.model.vo.Member"%>
<%@page import="java.sql.Date"%>
<%@page import="com.threego.app.request.model.vo.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member_page.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/request_list_view.css"/>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2398d9caf132d6eea659a665e6afbaf&libraries=services,clusterer,drawing"></script>
</head>
<%
	Request acceptedRequest = (Request)request.getAttribute("acceptedRequest");
	Member writer = (Member)request.getAttribute("writer");
	Date reqCpDate = acceptedRequest.getReqCpDate();
%>
<body>
	<!-- 여기는 수거리스트 보기 클릭시 팝업에 들어가는 html 입니다 -->
	<div class="requestDetail-container">
		<div class="requestDetail-tbl-container">
			<fieldset id="requestDetail-wrap">
				<h3>접수 내역 상세</h3>
				<hr>
				<table id="requestDetail">
					<tr>
						<th>접수번호</th>
						<td><%= acceptedRequest.getReqNo()%></td>
					</tr>
					<tr>
						<th>접수자</th>
						<td><%= acceptedRequest.getReqWriter()%>(<%=writer.getName()%>)</td>
					</tr>
					<tr>
						<th>접수지역</th>
						<td><%=acceptedRequest.getReqLocationId() %></td>

					</tr>
					<tr>
						<th>상세주소</th>
						<td><%=writer.getAddress() %></td>
					</tr>
					<tr>
						<th>접수일자</th>
						<td><%=acceptedRequest.getReqDate() %></td>
					</tr>
					<tr>
						<th>접수사진</th>
						<td>
							<%--
     				<img src = "<%=request.getContextPath()%>/upload/reqphoto/<%=acceptedRequest.getReqPhoto()%>">
                	 --%>
						</td>
					</tr>
					<tr>
						<th>접수현황</th>
						<%if(acceptedRequest.getReqStatus().equals("0")){ %>
						<td>수거대기중</td>
						<%} else if(acceptedRequest.getReqStatus().equals("1")){ %>
						<td>수거중</td>
						<%} else if(acceptedRequest.getReqStatus().equals("2")){%>
						<td>수거완료</td>
						<%} else if(acceptedRequest.getReqStatus().equals("3")){ %>
						<td>수거취소</td>
						<%} %>
					</tr>
					<tr>
						<th>담당 수고미</th>
						<%if(acceptedRequest.getReqRider() != null){ %>
						<td><%=acceptedRequest.getReqRider() %></td>
						<%} else { %>
						<td>미지정</td>
						<% } %>
					</tr>
					<tr>
						<th>처리일자</th>
						<% if(reqCpDate !=null){ %>
						<td><%=acceptedRequest.getReqCpDate()%></td>
						<% } else{ %>
						<td>미등록</td>
						<%} %>
					</tr>
				</table>
				<div class="btn-wrapper">
					<% if(acceptedRequest.getReqStatus().equals("0")){ %>
					<form name="requestDetailFrm"
						action="<%=request.getContextPath()%>/request/acceptRequest"
						method="POST">
						<input type="hidden" name="reqNo"
							value="<%=acceptedRequest.getReqNo()%>"> <input
							type="hidden" name="reqWriter"
							value="<%=acceptedRequest.getReqWriter()%>"> <input
							type="hidden" name="reqStatus" value="1">
						<button type="submit" class="btn-accept" id="btn-accept">수락</button>
					</form>
					<%} else if(acceptedRequest.getReqStatus().equals("1")){ %>
					<form name="requestCancelFrm"
						action="<%=request.getContextPath()%>/request/acceptRequest"
						method="POST">
						<input type="hidden" name="reqNo"
							value="<%=acceptedRequest.getReqNo()%>"> <input
							type="hidden" name="reqWriter"
							value="<%=acceptedRequest.getReqWriter()%>"> <input
							type="hidden" name="reqStatus" value="3">
						<button type="submit" class="btn-accept" id="btn-cancle">수락취소</button>
					</form>
					<form name="requestCompleteFrm"
						action="<%=request.getContextPath()%>/request/acceptRequest"
						method="POST">
						<input type="hidden" name="reqNo"
							value="<%=acceptedRequest.getReqNo()%>"> <input
							type="hidden" name="reqWriter"
							value="<%=acceptedRequest.getReqWriter()%>"> <input
							type="hidden" name="reqStatus" value="2">
						<button type="submit" class="btn-accept" id="btn-cancle">처리완료</button>
					</form>
					<%} %>
					<button type="button" class="btn-accept" id="btn-close"
						onclick="popupClose();">닫기</button>
				</div>
			</fieldset>
		</div>
		<%if(acceptedRequest.getReqStatus().equals("0")){%>
		<div class="map-wrapper">
			<h3 id="map-title">수거위치 확인</h3>
			<input type = "hidden" id = "map-target" value = "수거위치">
			<hr>
			<div id="map" style="width: 500px; height: 430px;"></div>
			<button class="map-btn" id="map-btn">길찾기</button>
		</div>
		<% } %>
	</div>
</body>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('<%=writer.getAddress()%>', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    var lat = result[0].y; // 위도
	var lng = result[0].x; // 경도

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;font-weight : bold; color : white; background-color : #303F9F;">수거위치</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
    
    var mapbtn = document.getElementById('map-btn');
	mapbtn.addEventListener("click", function() {
		window.location = "https://map.kakao.com/link/to/"+document.getElementById("map-target").value+","+lat+","+lng;
	})
    
} 
});  
    </script>
<script>
const popupClose = () =>{
	opener.parent.location.reload();
	window.close();
}

</script>

</html>