<%@page import="java.sql.Date"%>
<%@page import="com.threego.app.request.model.vo.Request"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
List<Request> MyRequestList = (List<Request>) request.getAttribute("requestList");
Request acceptedRequest = (Request) request.getAttribute("acceptedRequest");
String memberId = loginMember.getId();
%>
<%
String msg = (String) session.getAttribute("msg");
if (msg != null && !msg.isEmpty()) {
%>
<script>
alert("<%=msg%>");
</script>
<%
session.removeAttribute("msg");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 수거 목록</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member_page.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/request_lists.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/warning.css" />
</head>
<body>

	<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
	<div class="mypage-container">
			<div class="left-div">
				<h2>마이페이지</h2>
				<ul>
					<li><a class="" aria-current="page"
						href="<%=request.getContextPath()%>/member/myPage">회원정보 수정</a></li>
					<%
					if (loginMember != null && loginMember.getMemberRole() == MemberRole.U) {
					%>
					<li><a class="" aria-current="page"
						href="<%=request.getContextPath()%>/member/paymentList?memberId=<%=memberId%>">결제정보</a></li>
					<li><a class="" aria-current="page"
						href="<%=request.getContextPath()%>/member/requestList?memberId=<%=memberId%>">수거신청내역</a></li>
					<%
					} else if (loginMember != null && loginMember.getMemberRole() == MemberRole.R) {
					%>
					<li><a class="" aria-current="page"
						href="<%=request.getContextPath()%>/rider/requestCollectionList">수거
							리스트</a></li>
					<li class="active"><a class="" aria-current="page"
						href="<%=request.getContextPath()%>/rider/riderCollectionListCheck">나의
							수거 목록 조회</a></li>
					<%
					}
					%>
					<li><a class="" aria-current="page"
						href="<%= request.getContextPath() %>/member/notebox?memberId=<%= memberId %>">📑받은 메시지</a></li>
				</ul>
			</div>
			<div class="right-div">
				<h3>나의 수거 목록 리스트</h3>
				<div class="mypage-content-box">
						<table id="collection-tbl">
							<thead>
								<tr>
									<th>요청번호</th>
									<th>수거지역</th>
									<th>수거일자</th>
									<th>수거상태</th>
									<th>완료날짜</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<!-- JSP에서 데이터를 반복해서 출력하는 부분 -->
								<%-- 예시 데이터 --%>
								<%
								for (Request requests : MyRequestList) {
								%>

								<tr>
									<td><%=requests.getReqNo()%></td>
									<td><%=requests.getReqLocationId()%></td>
									<td><%=requests.getReqDate()%></td>
>>>>>>> branch 'master' of https://github.com/semijo6/semi-project.git
									<%
									if (requests.getReqStatus().equals("1")) {
									%>
									<td>수거중</td>
									<%
									} else if (requests.getReqStatus().equals("2")) {
									%>
									<td>수거완료</td>
									<%
									} else if (requests.getReqStatus().equals("3")) {
									%>
									<td>수거취소</td>
									<%
									}
									%>

									<td><%=requests.getReqCpDate() == null ? "미완료" : requests.getReqCpDate()%></td>
									<td>
										<form name="requestDetailForm"
											action="<%=request.getContextPath()%>/request/requestDetail"
											style="display: inline;">
											<input type="hidden" name="reqNo"
												value="<%=requests.getReqNo()%>"> <input
												type="hidden" name="reqWriter"
												value="<%=requests.getReqWriter()%>">
											<button type="button" class="btn-accept"
												onclick="requestDetail(this.parentElement);">상세보기</button>
										</form>
										<form name="requestwarningForm" style="display: inline;">
											<input type="hidden" name="reqNo"
												value="<%=requests.getReqNo()%>"> <input
												type="hidden" name="riderId"
												value="<%=loginMember.getId()%>">
											<button type="button" id="btn-warning"
												onclick="openModal(this)">신고</button>
										</form>
									</td>

								</tr>
							</tbody>
							<%
							}
							%>
						</table>
					</div>
				</div>
			</div>

	<div id="warningMadal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h3>신고하기</h3>
			<form name="warningForm"
				action="<%=request.getContextPath()%>/warning/riderSendwarning"
				method="post">
				<span>요청 번호</span><input type="text" name="reqNo" value="" required
					readonly><br> <span>신고자 아이디</span><input type="text"
					name="riderId" value="" required readonly>
				<!-- 신고 폼 요소들 추가 -->
				<textarea name="warningReason" placeholder="신고 사유를 입력하세요"
					style="width: 587px; height: 200px;"></textarea>
				<button type="submit">신고 제출</button>
			</form>
		</div>
	</div>
	<script>

// 상세보기 오픈 팝업
const requestDetail = (frm) => {
	
	const title = "requestDetailPopUp"; 
	const popup = window.open("", title, "width = 700px, height = 500px");
	
	frm.target = title;
	frm.submit();
	
}

// 모달 열기
function openModal(button) {
  const reqNo = button.parentNode.querySelector('input[name="reqNo"]').value;
  const riderId = button.parentNode.querySelector('input[name="riderId"]').value;
  const warningMadal = document.getElementById("warningMadal");
  const modalClose = warningMadal.querySelector(".modal-close");
  // warningMadal은 모달요소의 DOm 객체를 가리키는데 클래스선택자를 통해 닫기버튼, 외부영역 을 변수에 할당하여 닫히게만든것~
  const modalOverlay = warningMadal.querySelector(".modal-overlay");

  // 모달 내의 필요한 요소들에 값을 할당
  warningMadal.querySelector('input[name="reqNo"]').value = reqNo;
  warningMadal.querySelector('input[name="riderId"]').value = riderId;

  // 모달 열기
  warningMadal.style.display = "block";

  // 모달 닫기
  modalClose.addEventListener("click", closeModal);
  modalOverlay.addEventListener("click", closeModal);

  function closeModal() {
    warningMadal.style.display = "none";
  }

  // 모달 닫기 버튼 클릭 이벤트 설정
  modalClose.addEventListener("click", closeModal);
  modalOverlay.addEventListener("click", closeModal);
}

// 모달 닫기
function closeModal() {
  const warningMadal = document.getElementById("warningMadal");
  warningMadal.style.display = "none";
}


document.warningForm.onsubmit = (e) => {
	  const content = e.target.warningReason.value;
	  
	  // 문자로만 이루어져 있는지 확인
	  if (content.replace(/\s/g, "").length < 1) {
	    alert("최소 1글자 이상의 값을 입력해주세요.");
	    return false;
	  }
	}
</script>

</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
