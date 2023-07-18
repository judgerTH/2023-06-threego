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
.rider-info-boxes { -
	-bs-gutter-x: 1.5rem; -
	-bs-gutter-y: 0 display: flex;
	flex-wrap: wrap;
	margin-top: calc(-1 * var(- -bs-gutter-y));
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

#riderbtn {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

#riderbtn button {
	width: 400px;
	height: 50px;
	background-color: #49B466;
	color: white;
	font-weight: bold;
	font-size: 20px;
	border: none;
}

hr {
	margin-left: 150px;
	margin-right: 150px;
}

h1 {
	margin-left: 150px;
}

#btn1, #btn3, #btn4, #btn5, #applicationForm {
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
	<br>
	<br>
	<br>
	<br>
	<div id="buyForm" style="display: none;">
		<h1>신청/구매</h1>
		<hr>
		<button id="btn1">신청하기</button>
		<button id="btn2">이용권 구매</button>
		<div id="buyFrm" style="display: none;">

			<div class="baaan">
				<div class="payment_option_wrap">
					<strong class="req short">입금은행</strong>

					<div class="select_section">
						<div id="bankCodeList" class="selectbox-noscript">
							<select name="selBank"
								class="selectbox-source _nonBankBookPayBankCode _payForm">
								<option value="농협" selected>농협</option>
								<option value="국민은행">국민은행</option>
								<option value="신한은행">신한은행</option>
								<option value="우리은행">우리은행</option>
								<option value="기업은행">기업은행</option>
								<option value="하나은행">하나은행</option>
								<option value="대구은행">대구은행</option>
								<option value="부산은행">부산은행</option>
								<option value="우체국">우체국</option>
								<option value="제일은행">SC제일은행</option>
								<option value="광주은행">광주은행</option>
								<option value="경남은행">경남은행</option>
								<option value="수협">수협</option>
								<option value="케이뱅크">케이뱅크</option>
							</select>
							<div class="selectbox-box">
								<div class="selectbox-label"></div>
							</div>
							<div class="selectbox-layer layer_width_base">
								<div class="selectbox-list"></div>
							</div>
							<span class="drop"></span>
						</div>
					</div>
					<br> <label for="ticket">이용권구매</label> <select name="ticket"
						id="ticket">
						<option value="1" selected>1</option>
						<option value="3">3</option>
						<option value="5">5</option>
						<option value="10">10</option>
					</select> <a>회권</a> <br> <label for="price">결제금액: </label> <span
						id="selectedPrice"></span>
				</div>
			</div>





		</div>
		<!--  구입하기 눌렀을때, -->



		<div id="paymentForm" style="display: none;">
			<h2>무통장 입금 안내</h2>
			<p>아래 계좌로 결제금액을 입금해주세요.</p>
			<p>
				은행: <span id="bankName"></span>
			</p>
			<p>
				계좌번호: <span id="accountNumber"></span>
			</p>
			<p>
				결제금액: <span id="amount"></span>
			</p>
			<p>
				입금기한: <span id="depoLine"></span>
			</p>
		</div>
		<form id="applicationForm">
			<%if(loginMember != null){ %>
			<label for="id">아이디:</label> <input id="id"
				value="<%= loginMember.getId() %>" disabled> <br> <label
				for="name">이름:</label> <input id="name"
				value="<%= loginMember.getName() %>" disabled> <br> <label
				for="address">주소:</label> <input type="text" id="address"
				value="<%= loginMember.getAddress() %>" disabled>
			<button type="button" id="changeAddressBtn">주소변경</button>
			<br> <label for="photo">사진:</label> <input type="file"
				id="photo" accept="image/jpeg, image/png"
				style="width: 200px; height: 200px;" required> <br>
			<%} %>
		</form>



		<hr>
		<button id="btn3" style="display: none;">구매하기</button>
		<button id="btn4" style="display: none;">입금 완료</button>
		<button id="btn5">신청하기</button>

	</div>






	<script>
	application.onclick=(e)=>{
		<%if(loginMember == null) {%>
		alert("로그인 후 이용 가능합니다."); <%}else{%>
		document.querySelector("#beforeContent").style.display="none";
		document.querySelector("#buyForm").style.display="block";
		<%}%>
	}
	
	
	
	btn1.onclick = () => {
		event.preventDefault();
		document.getElementById("applicationForm").style.display="block";
		document.getElementById("buyFrm").style.display = "none"; 
		btn3.style.display = "none";
		btn5.style.display = "block";
		
	}
	 btn2.onclick = () => {
		    document.getElementById("buyFrm").style.display = "block";
		    btn3.style.display = "block";
		    btn5.style.display = "none";
		    document.getElementById("applicationForm").style.display = "none";

		    // 가격 정보 객체 생성
		    const priceInfo = {
		      1: 5000,
		      3: 15000,
		      5: 23900,
		      10: 46900
		    };

		    // 회권 선택 요소 가져오기
		    const ticketSelect = document.getElementById("ticket");
		    // 결제금액 표시 요소 가져오기
		    const priceLabel = document.getElementById("selectedPrice");

		    // 회권 선택 이벤트 처리
		    ticketSelect.addEventListener("change", function() {
		      // 선택된 회권 값 가져오기
		      const selectedTicket = parseInt(ticketSelect.value);

		      // 선택된 회권에 따른 가격 표시
		      const price = priceInfo[selectedTicket];
		      priceLabel.textContent = price + "원";
		    });

		    // 초기 설정: 기본 회권과 가격 표시
		    const initialTicket = parseInt(ticketSelect.value);
		    const initialPrice = priceInfo[initialTicket];
		    priceLabel.textContent = initialPrice;

		    // 구매하기 버튼 클릭 이벤트 처리
		    btn3.onclick = () => {
		      event.preventDefault(); // 기본 이벤트 중단

		      // 선택한 회권 값 가져오기
		      const selectedTicket = parseInt(ticketSelect.value);
		      // 선택한 회권에 따른 가격 가져오기
		      const selectedPrice = priceInfo[selectedTicket];
		      // 결제금액 표시 요소 업데이트
		      priceLabel.textContent = selectedPrice + "원";

		      const bankSelect = document.querySelector('select[name="selBank"]');
		      const selectedBank = bankSelect.value;

		      const bankNameElement = document.getElementById("bankName");
		      bankNameElement.textContent = selectedBank;

		      const amountElement = document.getElementById("amount");
		      amountElement.textContent = selectedPrice + "원";

		      // 이용횟수 가져오기
		      const purchaseCount = parseInt(selectedTicket);

		      $.ajax({
		    	  url: "<%=request.getContextPath()%>/payment/insertpayment",
		    	  method: "POST",
		    	  data: {
		    	    memberId: document.getElementById("id").value,
		    	    ticketId: ticketSelect.value,
		    	    purchaseCount: purchaseCount
		    	  },
		    	  success(responseText) {
		    		  console.log(responseText);
		    	    const {result} = responseText;
		    	    alert(result);
		    	    
		    	    document.getElementById("buyFrm").style.display = "none";
		    	    btn3.style.display = "none";
		    	    btn4.style.display = "block";
		    	  },
		    	  error() {
		    	    alert("구매 정보 저장에 실패하였습니다. 다시 시도해주세요.");
		    	  }
		    	});


		      // 폼 표시
		      const paymentForm = document.getElementById("paymentForm");
		      paymentForm.style.display = "block";
		    };
		  };
	
		// 기본 설정: 폼 초기화
		const paymentForm = document.getElementById("paymentForm");
		paymentForm.style.display = "none";
	
	
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
