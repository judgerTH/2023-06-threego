<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신청/구매</title>
</head>

<body>

    <br><br><br><br>
    <h1>수고</h1>
    <hr>
    <button id="btn1">신청하기</button>
    <button id="btn2">이용권 구매</button>

    <div class="virtualAccount _tr_paymeans _accountInfo">
        <div class="payment_option_wrap">
            <strong class="req short">입금은행</strong>

            <div class="select_section">
                <div id="bankCodeList" class="selectbox-noscript">
                    <select name="selBank"
                        class="selectbox-source _nonBankBookPayBankCode _payForm">
                        <option value="011" selected>농협</option>
                        <option value="004">국민은행</option>
                        <option value="088">신한은행</option>
                        <option value="020">우리은행</option>
                        <option value="003">기업은행</option>
                        <option value="081">하나은행</option>
                        <option value="031">대구은행</option>
                        <option value="032">부산은행</option>
                        <option value="071">우체국</option>
                        <option value="023">SC제일은행</option>
                        <option value="034">광주은행</option>
                        <option value="039">경남은행</option>
                        <option value="007">수협</option>
                        <option value="089">케이뱅크</option>
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
            <br>
            <label for="ticket">이용권구매</label>
            <select name="ticket" id="ticket">
                <option value="1" selected>1</option>
                <option value="3">3</option>
                <option value="5">5</option>
                <option value="10">10</option>
            </select>
            <a>회권</a>
            <br>
            <label for="price">결제금액</label>
            <span id="selectedPrice"></span>
        </div>
    </div>
    <button id="btn3">구매하기</button>

    <div id="paymentForm" style="display: none;">
        <h2>무통장 입금 안내</h2>
        <p>아래 계좌로 결제금액을 입금해주세요.</p>
        <p>은행: <span id="bankName"></span></p>
        <p>계좌번호: <span id="accountNumber"></span></p>
    </div>

    <script>
		// 가격 정보 객체 생성
		const priceInfo = {
			1: "5000원",
			3: "15000원",
			5: "23900원",
			10: "46900원"
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
			priceLabel.textContent = price;
		});
	
		// 초기 설정: 기본 회권과 가격 표시
		const initialTicket = parseInt(ticketSelect.value);
		const initialPrice = priceInfo[initialTicket];
		priceLabel.textContent = initialPrice;

		/*
		// 신청하기 버튼 클릭 이벤트 처리
		const applyButton = document.getElementById("btn3");
		applyButton.addEventListener("click", function(event) {
			event.preventDefault(); // 기본 이벤트 중단
			
			// 선택한 회권 값 가져오기
			const selectedTicket = parseInt(ticketSelect.value);
			// 선택한 회권에 따른 가격 가져오기
			const selectedPrice = priceInfo[selectedTicket];
			// 결제금액 표시 요소 업데이트
			priceLabel.textContent = selectedPrice;
	
			// 폼 표시
			const paymentForm = document.getElementById("paymentForm");
			paymentForm.style.display = "block";
		});
	
		// 기본 설정: 폼 초기화
		const paymentForm = document.getElementById("paymentForm");
		paymentForm.style.display = "none";
		*/
		
	</script>
	
	
	
	<br><br><br><br><br><br><br>

</body>

</html>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>