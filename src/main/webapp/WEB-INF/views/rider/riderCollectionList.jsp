<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수거접수 현황</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
<%
    	String memberId = loginMember.getId();
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member_page.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/request_lists.css" />
</head>
<body>
	<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
	<div class="mypage-container">
			<div class="left-div">
				<h2>마이페이지</h2>
				<ul>
					<li><a class="" aria-current="page"
						href="<%= request.getContextPath() %>/member/myPage">회원정보 수정</a></li>
					<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.U){ %>
					<li><a class="" aria-current="page"
						href="<%= request.getContextPath() %>/member/paymentList?memberId=<%= memberId %>">결제정보</a></li>
					<li><a class="" aria-current="page"
						href="<%= request.getContextPath() %>/member/requestList?memberId=<%= memberId %>">수거신청내역</a></li>

					<% } else if(loginMember != null && loginMember.getMemberRole() == MemberRole.R) { %>
					<li class="active"><a class="" aria-current="page"
						href="<%= request.getContextPath() %>/rider/requestCollectionList">수거
							접수 리스트</a></li>
					<li><a class="" aria-current="page"
						href="<%= request.getContextPath() %>/rider/riderCollectionListCheck">나의
							수거 목록 조회</a></li>
					<% } %>
					<li><a class="" aria-current="page"
						href="<%= request.getContextPath() %>/member/notebox">📑받은 메시지</a></li>

				</ul>
			</div>
			<div class="right-div">
				<h3>수거접수 리스트</h3>
				<div class="mypage-content-box">
						<table id="collection-tbl">
							<thead>
								<tr>
									<th>접수번호</th>
									<th>접수자</th>
									<th>접수지역</th>
									<th>접수일자</th>
									<th>접수현황</th>
									<th>접수상세</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>
</body>
<script> 
window.onload = () => { 
   findAllList(); 
} 



const findAllList = () =>{
	
	
	 $.ajax({ 
	 	url : "<%=request.getContextPath()%>/rider/findAllRequest",
	 	data : "json",
	 	success(responseData){
			
	 		console.log(responseData);
	 		responseData.forEach((request)=>{
	 		
		 		const {reqNo, reqWriter, reqLocationId, reqPhoto, reqDate} = request;
		 		let {reqStatus} = request;
		 		const tbody = document.querySelector("#collection-tbl tbody");
		 		
		 		if (reqStatus == '0') {
		 		    reqStatus = "수거 대기중";
		 		} else if (reqStatus == '1') {
		 		    reqStatus = "수거중";
		 		} else if (reqStatus == '2') {
		 		    reqStatus = "수거완료";
		 		} else {
		 		    reqStatus = "수거취소";		
		 		}
				
		 		if(reqStatus == "수거 대기중"){
			 		tbody.innerHTML += `
						<tr>
			                <td>\${reqNo}</td>
			                <td>\${reqWriter}</td>
			                <td>\${reqLocationId}</td>
			                <td>\${reqDate}</td>
			                <td>\${reqStatus}</td>
			                <td>
			                <form name = "acceptRequestFrm" action = "<%= request.getContextPath()%>/request/acceptRequest">
				                <input type="hidden" name="reqNo" value="\${reqNo}">
				                <input type="hidden" name="reqWriter" value="\${reqWriter}">
				                <button type="button" class = "btn-accept" onclick = "acceptRequest(this.parentElement);">보기</button>
				       
				            </form>
			                </td>
			            </tr>
			 		`;
		 		}
		 		
	 		}); 
	 	}
	});
	 
} 
// 각 행마다 내용을 받아와야 하니 frm을 받아와서 함수를 실행하도록
const acceptRequest = (frm) => {
	
	const title = "acceptRequestPopUp"; 
	const popup = window.open("", title, "width = 1100px, height = 600px");
	
	frm.target = title;
	frm.submit();
	
}

</script>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>