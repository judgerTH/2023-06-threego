<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<%
	/* String memberId = loginMember.getId(); */
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신청/구매</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>

<style>
.left-div ul {
	list-style: none;
	padding: 0;
	margin: 0;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	display: flex;
}

.left-div ul li {
	margin-right: 10px;
}

.left-div ul a {
	display: inline-block;
	width: 200px;
	border-radius: 15px;
	background-color: #e9e9e9;
	text-align: center;
	line-height: 30px;
	text-decoration: none;
	color: #000000;
	font-size: 20px;
}

.left-div ul a:hover {
	background-color: #49B466;
	color: white;
}

.left-div ul .active a {
	background-color: #00000;
	color: #000000;
}

.left-div {
	display: flex;
	flex-direction: column;
	align-items: left;
	margin-left: 180px;
	width: 200px;
	float: left;
}

.left-div ul li {
	display: inline-block;
	margin-right: 10px;
}

.rider-info-boxes { -
	-bs-gutter-x: 1.5rem; -
	-bs-gutter-y: 0 display: flex;
	flex-wrap: wrap;
	margin-top: 200px;
	margin-right: 20%;
	margin-left: 20%;
	justify-content: space-between !important;
}

.rider-info-box {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
}

#riderimg {
	width: 600px;
	display: Felx;
}

#riderbtn, #paysubmit {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
	margin-left: 20px;
}

#riderbtn button, #paysubmit {
	width: 400px;
	height: 50px;
	background-color: #49B466;
	color: white;
	font-weight: bold;
	font-size: 20px;
	border: none;
	margin: 30px 100px;
}

hr {
	margin-left: 150px;
	margin-right: 150px;
}

h1 {
	margin-left: 150px;
}

#btn1, #btn3, #btn4, #btn5, #applicationForm, #paysubmit {
	margin-top: 10px;
	margin-left: 150px;
}
/* #btn1 {
	background-color: #49B466;
	
} */
.baaan {
	margin-top: 30px;
	margin-left: 150px;
}

.select_section {
	display: inline-block;
}

#paymentForm {
	margin-left: 150px;
}
/* 주소 입력란 스타일 */
#address {
	border: none;
	background-color: transparent;
}

/* 나머지 입력란 스타일 */
input:not(#address), input[type="file"] {
	border: none;
	outline: none;
	background-color: transparent;
}
</style>
</head>

<body>
	<div class="left-div" style="display: none">
		<h2>신청하기</h2>
		<ul>
			<li><a class="active" aria-current="page" href="">수거 신청</a></li>
			<li><a class="active" id="active1" aria-current="page"
				href="<%=request.getContextPath()%>/board/useInquiryList">이용권 구매</a></li>
		</ul>
	</div>
	<section id="board-container">
		<div id="tbl-boardWarpper">
			<table id="tbl-board">
				<thead>
					<tr>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr></tr>
					<th></th>

				</tbody>
			</table>
		</div>

	</section>
	<div class="rider-info-boxes" id="beforeContent">
		<div class="rider-info-box">
			<img id="riderimg" src="../images/riderinfo.png">
			<div class="rider-text-box">
				<strong> <span>📮</span> &nbsp;수거신청 소개<br>
				</strong> <br>
				<p>
					<span>01. </span>&nbsp;회원가입을 통해 신청하기.
				</p>
				<br>
				<p>
					<span>02. </span>&nbsp; 이용권 구매하기 및 신청버튼 클릭.
				</p>
				<br>
				<p>
					<span>03. </span>&nbsp;수거지역 맞게 설정하기.
				</p>
				<br>
				<p>
					<span>04. </span>&nbsp; 정해진 규격에 맞게 쓰레기 담고, 문앞에 두기.
				</p>
				<br>
				<p>
					<span>05. </span>&nbsp; 📸 문앞에 둔 쓰레기 사진찍기
				</p>
				<br>
				<p>
					<span>06. </span>&nbsp; 사진 첨부 후 수거 신청 버튼 클릭하기.
				</p>
				<br>
			</div>
			<br>

		</div>
		<div id="riderbtn">
			<button id="application">수거신청 하기</button>
		</div>
	</div>

	<div id="afterContent">
		<form name="memberUpdateFrm"
			action="<%= request.getContextPath() %>/payment/insertpayment"
			method="post">
			<table class="mypage-table"
				style="width: 800px; height: 400px; margin: 0 auto;">
				<tbody>
					<tr>
						<th>아이디</th>
						<% if (loginMember != null) { %>
						<td><input type="text" name="id" id="userId"
							value="<%= loginMember.getId() %>" required readonly></td>
						<% } %>
					</tr>
					<tr>
						<th>상품권 종류 <span>*</span></th>
						<td><select name="ticketSelect" id="ticketSelect"
							required="required" onchange="updatePrice()">
								<option value="">선택하세요</option>
								<option value="tic1">1회권 &#8361;5,000원</option>
								<option value="tic3">3회권 &#8361;15,000원</option>
								<option value="tic5">5회권 &#8361;23,900원</option>
								<option value="tic10">10회권 &#8361;46,900원</option>
						</select></td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td><input type="text" name="price" id="priceInput"
							required="required" readonly> <br>
							<div id="gunroinfo" style="font-size: 12px;">중복구매가 불가하오니
								이용중인 상품권이 있으면 소진 후 구매 부탁드립니다.</div></td>
					</tr>
					<tr>
						<th>입금계좌</th>
						<td>카카오뱅크 : 3333-1111-9999 <br> 예금주 명 : 황대호 <br> <br>
							<div id="gunroinfo" style="font-size: 12px;">중복구매가 불가하오니
								이용중인 상품권이 있으면 소진 후 구매 부탁드립니다.</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="riderbtn">
				<button type="button" id="paysubmit" onclick="showPaymentPopup()">입금
					완료</button>
			</div>
		</form>
	</div>

	<script>
	
	paysubmit.onclick =()=>{
	 const selectElement = document.getElementById('ticketSelect');
	 const selectedOption = selectElement.options[selectElement.selectedIndex];
		  // 상품권 종류 선택 여부 확인
		  if (selectedOption.value === '') {
		    alert('상품권 종류를 선택해주세요.');
		    return; // 선택되지 않았을 경우 함수 종료
		  }
		alert("구매 완료 되었습니다.");
		const frm = document.memberUpdateFrm;
		frm.submit();
	}
	
function updatePrice() {
	  const selectElement = document.getElementById('ticketSelect');
	  const priceInput = document.getElementById('priceInput');
	  const selectedOption = selectElement.options[selectElement.selectedIndex];

	  if (selectedOption.value === '') {
	    priceInput.value = '';
	  } else {
	    priceInput.value = selectedOption.text.split(' ')[1];
	  }
	}

	application.onclick=(e)=>{
		<%if(loginMember == null) {%>
		alert("로그인 후 이용 가능합니다."); <%}else{%>
		document.querySelector("#beforeContent").style.display="none";
		document.querySelector(".left-div").style.display="block";
		
		<%}%>
	}
	
	
	
	</script>



	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

</body>

</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
