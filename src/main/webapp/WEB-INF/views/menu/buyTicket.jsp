<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<%
String memberId = loginMember.getId();
String name = loginMember.getName();
String password = loginMember.getPwd();
String email = loginMember.getEmail();
String phone = loginMember.getPhone();
String post = loginMember.getPost();
String address = loginMember.getAddress();

String addr1 = address.substring(0, address.indexOf(" "));
String addr2 = address.substring(address.indexOf(" ") + 1);




%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신청/구매</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>

<style>
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
.address-input {
	display: flex;
	align-items: center;
}

.address-input label {
	margin-right: 10px;
}

.address-container {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#address {
	flex-grow: 1;
	border: none;
	background-color: transparent;
	margin-right: 5px;
	width: auto;
}

#changeAddressBtn {
	margin-left: 10px;
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

	<br>
	<br>
	<br>
	<br>
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
			계좌번호: <span id="accountNumber">89878676767676767</span>
		</p>
		<p>
			결제금액: <span id="amount"></span>
		</p>
		<p>
			입금기한: <span id="depoLine"></span>
		</p>
	</div>

	<form id="applicationForm" enctype="multipart/form-data">
		<div class="form-group">
			<label for="id">아이디:</label> <input id="id"
				value="<%=loginMember.getId()%>" disabled>
		</div>

		<div class="form-group">
			<label for="name">이름:</label> <input id="name"
				value="<%=loginMember.getName()%>" disabled>
		</div>

		<div class="form-group">
			<div class="address-input">
				<label for="postalCode">우편번호*:</label> <input type="text"
					id="postalCode" value="<%=loginMember.getPost()%>" readonly>
			</div>
		</div>
		<div class="form-group">
			<label for="tCnt">남은이용권:</label><input id="tCnt" value="" disabled>
		
		</div>
		<div class="form-group">
			<label for="address">주소*:</label> <input type="text" id="address"
				value="<%=loginMember.getAddress()%>" readonly>
			<button type="button" id="changeAddressBtn" onclick="addressSearch()">주소변경</button>
		</div>
		<div class="form-group" id="detailAddressGroup" style="display: none;">
			<label for="detailAddress">상세주소:</label> <input type="text"
				id="detailAddress">
		</div>

		<div class="form-group">
			<label for="photo">사진*:</label> <input type="file" id="photo"
				accept="image/jpeg, image/png" required>
			<div id="previewContainer"
				style="width: 150px; height: 150px; margin-top: 10px;"></div>
			<!-- 이미지 미리보기를 표시할 컨테이너 -->
		</div>

	</form>

	<hr>
	<button id="btn3" style="display: none;">구매하기</button>
	<button id="btn4" style="display: none;">입금 완료</button>
	<button id="btn5">신청하기</button>

	<script>
	
	const fileInput = document.getElementById("photo");
    const previewContainer = document.getElementById("previewContainer");

    fileInput.addEventListener("change", function() {
      const file = this.files[0]; // 선택한 파일 가져오기
      if (file) {
        const reader = new FileReader();

        reader.addEventListener("load", function() {
          const image = new Image();
          image.src = this.result;
          image.style.maxWidth = "100%";
          image.style.maxHeight = "100%";
          image.style.objectFit = "contain";
          previewContainer.innerHTML = ""; // 기존 미리보기 제거
          previewContainer.appendChild(image); // 이미지 추가
        });

        reader.readAsDataURL(file); // 파일을 읽어 데이터 URL로 변환
      } else {
        previewContainer.innerHTML = ""; // 선택한 파일이 없을 경우 미리보기 제거
      }
    });
	
	
	
	
	
		btn1.onclick = () => {
			event.preventDefault();
			document.getElementById("applicationForm").style.display = "block";
			document.getElementById("buyFrm").style.display = "none";
			document.getElementById("paymentForm").style.display = "none";
			btn3.style.display = "none";
			btn4.style.display = "none";
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
    event.preventDefault();

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
        const { result } = responseText;
        alert(result);
		buyFrm.style.display="none";
        // 폼 표시
        const paymentForm = document.getElementById("paymentForm");
        paymentForm.style.display = "block";

        // 입금기한 계산 및 표시
        const depoLineElement = document.getElementById("depoLine");
        const currentDate = new Date();
        const dueDate = new Date(currentDate.getTime() + 2 * 24 * 60 * 60 * 1000); // 현재 시간에서 2일(48시간) 뒤
        const formattedDueDate = formatDate(dueDate);
        depoLineElement.textContent = formattedDueDate;
      },
      error() {
        alert("구매 정보 저장에 실패하였습니다. 다시 시도해주세요.");
      }
    });
  };

  // 날짜 포맷 변환 함수
  function formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    const hours = String(date.getHours()).padStart(2, "0");
    const minutes = String(date.getMinutes()).padStart(2, "0");

    return year+"년 "+month+"월 "+day+"일 "+hours+"시 "+minutes+"분"+"까지 입금부탁드립니다."
  }
		};
		
		btn4.onclick = () => {
			
		}

		btn5.onclick = () => {
			if(confirm("정말 등록?")){
			event.preventDefault();

			// 요청에 필요한 데이터 가져오기
			const id = document.getElementById("id").value;
			const address = document.getElementById("address").value;
			const detailAddress = document.getElementById("detailAddress").value;
			const photo = document.getElementById("photo").value;
			const post = document.getElementById("postalCode").value;
			
			const fAddress = address + " " + detailAddress;
			
			/* if (photo.files.length === 0) {
			    alert("사진을 선택해주세요.");
			    return;
			  } */
			
			// 데이터를 서버로 전송
			$.ajax({
				url: "<%=request.getContextPath()%>/request/reqGarbagePickup",
				method: "POST",
				data: {
					id: id,
					address: fAddress,
					detailAddress: detailAddress,
					photo: photo,
					post: post
				},
				success(responseText) {
					console.log(responseText);
					alert("신청이 성공적으로 처리되었습니다.");
				},
				error() {
					alert("신청을 처리하는 동안 오류가 발생했습니다.");
				}
			});
		}
		};

		

		// 기본 설정: 폼 초기화
		const paymentForm = document.getElementById("paymentForm");
		paymentForm.style.display = "none";
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function addressSearch() {
		  new daum.Postcode({
		    oncomplete: function(data) {
		      // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.

		      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다.
		      var addr = ''; // 주소 변수
		      var extraAddr = ''; // 참고항목 변수

		      // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		        addr = data.roadAddress;
		      } else { // 사용자가 지번 주소를 선택했을 경우(J)
		        addr = data.jibunAddress;
		      }

		      // 사용자가 선택한 주소가 도로명 타입일 때 참고항목을 조합한다.
		      if (data.userSelectedType === 'R') {
		        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
		          extraAddr += data.bname;
		        }
		        // 건물명이 있고, 공동주택일 경우 추가한다.
		        if (data.buildingName !== '' && data.apartment === 'Y') {
		          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		        }
		        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		        if (extraAddr !== '') {
		          extraAddr = ' (' + extraAddr + ')';
		        }
		      }

		      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		      document.getElementById('postalCode').value = data.zonecode;
		      document.getElementById("address").value = addr;
		      document.getElementById("detailAddress").value = ""; // 상세주소 필드 초기화

		      // 도로명 주소를 선택한 경우 상세주소 입력란을 보여줌
		      if (data.userSelectedType === 'R') {
		        document.getElementById("detailAddressGroup").style.display = "block";
		      } else {
		        document.getElementById("detailAddressGroup").style.display = "block";
		      }
		    }
		  }).open();
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
