<%@page import="java.sql.Date"%>
<%@page import="com.threego.app.request.model.vo.Request"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
List<Request> MyRequestList = (List<Request>) request.getAttribute("requestList");
%>
<%
String msg = (String) session.getAttribute("msg");
if (msg != null && !msg.isEmpty()) {
%>
<script>
alert("<%= msg %>");
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
<style>
#collection-tbl {
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	border-collapse: collapse;
}

#collection-tbl th, #collection-tbl td {
	border-left: 2px solid black;
	padding: 10px 40px;
}

#collection-tbl tr :first-of-type {
	border-left: none;
}

.collection-wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 30px;
}

.left-div ul {
	list-style: none;
	padding: 0;
	margin: 0;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.left-div ul li {
	display: list-item;
	margin-bottom: 10px;
}

.left-div ul a {
	display: inline-block;
	width: 160px;
	height: 30px;
	border-radius: 15px;
	background-color: #e9e9e9;
	text-align: center;
	line-height: 30px;
	text-decoration: none;
	color: #000000;
}

.left-div ul a:hover {
	background-color: #49B466;
	color: #fff;
}

.left-div ul .active a {
	background-color: #49B466;
	color: #fff;
}

.left-div {
	display: flex;
	flex-direction: column;
	align-items: left;
	margin-left: 180px;
	width: 200px;
	float: left;
}

input {
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}

.btn {
	border: solid 2px #24873a;
	border-radius: 50px;
	width: 25%;
	text-align: center;
	padding: 0.5rem;
	margin: 20px;
	margin-top: 20px;
	font-size: large;
	display: flex;
	justify-content: center;
	align-items: center;
}

.right-div {
	flex: 1;
	margin-left: 500px;
	flex-direction: column;
	display: flex;
	flex-wrap: wrap;
	width: 1200px;
}

.mypage-wrap {
	padding-top: 5rem;
	padding-bottom: 8rem;
}

.con {
	float: left;
}

h2 {
	margin-left: 60px;
}

#btn-accept {
	border: none;
	border-radius: 3px;
	background-color: #49B466;
	color: white;
	padding: 5px 15px;
	font-weight: bold;
}

#btn-warning {
	border: none;
	border-radius: 3px;
	background-color: red;
	color: white;
	padding: 5px 15px;
	font-weight: bold;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 60%;
	max-width: 600px;
	position: relative; /* 추가된 속성 */
}

.modal-close {
	color: #aaa;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
	position: absolute; /* 추가된 속성 */
	top: 10px; /* 상단 여백 */
	right: 10px; /* 우측 여백 */
}

.modal-close:hover, .modal-close:focus {
	color: #000;
	text-decoration: none;
}

/* 신고 폼 스타일 */
#warningMadal form {
	display: flex;
	flex-direction: column;
}

#warningMadal form span {
	margin-bottom: 10px;
}

#warningMadal form input, #warningMadal form textarea {
	margin-bottom: 10px;
	padding: 5px;
}

#warningMadal form button[type="submit"] {
	padding: 10px;
	background-color: #49B466;
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

#warningMadal form button[type="submit"]:hover {
	background-color: #24873a;
}

.close {
	display: flex;
	flex-direction: row-reverse;
	font-size: 30px; /* 닫기 버튼의 크기 조절 */
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="container_wr">
			<div id="con">
				<script
					src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
				<div class="mypage-wrap">
					<div class="container">
						<div class="left-div">
							<h2>마이페이지</h2>
							<ul>
								<li class="active"><a class="" aria-current="page"
									href="<%=request.getContextPath()%>/member/myPage">회원정보
										수정</a></li>
								<%
								if (loginMember != null && loginMember.getMemberRole() == MemberRole.U) {
								%>
								<li><a class="" aria-current="page"
									href="<%=request.getContextPath()%>/member/requestList">수거신청
										내역</a></li>
								<%
								} else if (loginMember != null && loginMember.getMemberRole() == MemberRole.R) {
								%>
								<li><a class="" aria-current="page"
									href="<%=request.getContextPath()%>/rider/requestCollectionList">수거
										리스트</a></li>
								<li><a class="" aria-current="page"
									href="<%=request.getContextPath()%>/rider/riderCollectionListCheck">나의
										수거 목록 조회</a></li>
								<%
								}
								%>
							</ul>
						</div>
					</div>
					<div class="collection-wrapper">
						<div class="collection-sub">
							<h3>나의 수거 목록 리스트</h3>
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
										<td><%=requests.getReqStatus().equals("1") ? "수거중" : "수거완료"%></td>

										<td><%=requests.getReqCpDate() == null ? "미완료" : requests.getReqCpDate()%></td>
										<td>
											<form name="requestDetailForm"
												action="<%=request.getContextPath()%>/collection/detail"
												method="post" style="display: inline;">
												<input type="hidden" name="reqNo"
													value="<%=requests.getReqNo()%>">
												<button type="submit" id="btn-accept">상세보기</button>
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
