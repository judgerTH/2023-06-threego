<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<title>회원가입약관 | 쓰리고</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/earlyaccess/notosanskr.css">
	
<meta name="viewport" id="meta_viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10">

<style>
#nextForm {
	display: none;
}

.start-register {
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn_confirm {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.col {
	font-size: 10px;
}

.row .col {
	font-size: 20px;
}

#agreemenu {
	background-color: green;
}

.row {
	color: white;
}

#info, #complete {
	background-color: #D2D2D2;
}

#registration-form {
	max-width: 900px; /* 폼의 최대 너비를 조정 */
	margin: 10;
}

#buttonsubmit {
	
}
</style>

<!-- 콘텐츠 시작 { -->
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<!-- 회원가입약관 동의 시작 { -->
			<div class="start-register">
				<div class="container">
					<div class="new-register-box">
						<div class="top-box">
							<div class="top-div">
								<h2>회원가입</h2>
							</div>
							<div class="container text-center">
								<div class="row">
									<div class="col" id="agreemenu">약관동의</div>
									<div class="col" id="info">정보입력</div>
									<div class="col" id="complete">가입완료</div>
								</div>
							</div>
						</div>
					</div>
					<form name="fregisterFrm">
						<section id="fregister_term" style="padding-top: 20px;">
							<h2>
								약관동의(필수) <span class="float-end"> <input type="checkbox"
									name="agree" value="1" id="agree11"> <label
									for="agree11" class="fs-6 fw-normal">동의함</label>
								</span>
							</h2>
							<div class="textareasize">
								<textarea readonly style="width: 1300px; height: 200px;">제1장 총칙.</textarea>
							</div>
						</section>
						<section id="fregister_private">
							<h2>
								개인정보 수집 및 이용 동의 (필수) <span class="float-end"> <input
									type="checkbox" name="agree2" value="1" id="agree21"> <label
									for="agree21" class="fs-6 fw-normal">동의함</label>
								</span>
							</h2>
							<textarea readonly style="width: 1300px; height: 200px;">개인정보처리방침</textarea>
						</section>
						<label for="chk_all"
							style="display: flex; justify-content: center;"> <input
							type="checkbox" name="chk_all" id="chk_all"
							style="margin-right: 5px;">이용약관, 개인정보 수집 및 이용 동의에 모두
							동의합니다.
						</label>
						<div class="btn_confirm">
							<button id="nextPage">다음 〉</button>
						</div>
					</form>
					<div id="nextForm">
						<form name="memberEnrollFrm">
				 							
							<table id="enroll">
								<tr>
									<th>아이디<span class="req">&nbsp;*</span></th>
									<td><input type="text" name="id" id="userId">
								</tr>
								<tr>
									<th>비밀번호<span class="req"&nbsp;>*</span></th>
									<td><input type="password" name="pwd" id="pwd"> </td>
								</tr>
								<tr>
									<th>비밀번호확인</th>
									<td><input type="password" id="pwdCheck"></td>
								</tr>
								<tr>
									<th>이름<span class="req">&nbsp;*</span></th>
									<td><input type="text" name="name" id="userName"></td>
								</tr>

								<tr>
									<th>이메일<span class="req">&nbsp;*</span></th>
									<td><input type="text" name="email" id="email" class="email"></td>
								</tr>
								<tr>
									<th>전화번호<span class="req">&nbsp;*</span></th>
									<td><input type="text" name="tel1" id="tel1" class="phone">-
										<input type="text" name="tel2" id="tel2" class="phone">-
										<input type="text" name="tel3" id="tel3" class="phone">
								</tr>
								<tr>
									<th>주소<span class="req">&nbsp;*</span></th>
									<td> <input type="text" id="postal" name="post" style="width: 100px" placeholder="우편번호" required/>
										<input type="button" id="postal-search"  value="검색" onclick="addressSearch()" /><br>
										<input type="text" id="userAddress" name="address" placeholder="주소" required/>
										  <input type="text" id="userDetailAddress" name="detailAddr" placeholder="상세 주소"  required />
									</td>
								</tr>
								<tr>
									<td colspan="2" class="btn-wrapper">
										<button>제출</button>
									&nbsp; <input type="reset" value="초기화" style="width: 80px;"></td>
								</tr>
							</table>
						
							
						</form>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- } 하단 끝 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function addressSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postal').value = data.zonecode;
                document.getElementById("userAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("userDetailAddress").focus();
            }
        }).open();
    }
</script>
<script>
	document.fregisterFrm.onsubmit=(e) =>{
		  
		const frm = e.target;
		const agree = e.target.agree;
		const agree2 = e.target.agree2;
		
		if (!agree.checked) {
	            alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
	            agree.focus();
	            return false;
	        };

	        if (!agree2.checked) {
	            alert("개인정보 수집 및 이용의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
	            e.agree2.focus();
	            return false;
	        };
	        
	        e.preventDefault();
	        document.getElementById('nextForm').style.display = 'block';
			document.fregisterFrm.style.display = 'none';
			document.getElementById('info').style.backgroundColor = 'green';
			document.getElementById('agreemenu').style.backgroundColor = '#D2D2D2';
	    };		
			
	
	
	
	
	jQuery(function($){
	    // 모두선택
	    $("input[name=chk_all]").click(function() {
	        if ($(this).prop('checked')) {
	            $("input[name^=agree]").prop('checked', true);
	        } else {
	            $("input[name^=agree]").prop("checked", false);
	        }
	    });
	});
			
</script>

<script>
document.memberEnrollFrm.onsubmit = function(e) {
	// 파일업로드를 포함한 비동기 요청
	// e.preventDefault();
	// 1. FormData객체 사용
	// 2. ajax 속성 - processData: false, contentType: false
	console.log(e.target);
	const frmData = new FormData(e.target);
	console.log(frmData);
	
	$.ajax({
		url : "<%= request.getContextPath() %>/member/memberEnroll",
		data : frmData,
		processData: false,
		contentType : false,
		method : "POST",
		dataType : "json",
		success(responseData) {
			console.log(responseData);
			const {result, message} = responseData;
			alert(message);
			
			
		},
		complete() {
			e.target.reset(); // 폼 초기화
		}
		
	});
	
	
	 // 동기적 폼제출 방지
	 e.preventDefault();
};

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>