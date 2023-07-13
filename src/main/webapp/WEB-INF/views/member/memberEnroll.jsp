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
									<td><input type="text" name="id" id="userId" >
									<div id="userIdAlert"></div></td>
								</tr>
								<tr>
									<th>비밀번호<span class="req"&nbsp;>*</span></th>
									<td><input type="password" name="pwd" id="pwd" > 
									<div id="userPwdAlert"></div></td>
								</tr>
								<tr>
									<th>비밀번호확인</th>
									<td><input type="password" id="pwdCheck" ></td>
								</tr>
								<tr>
									<th>이름<span class="req">&nbsp;*</span></th>
									<td><input type="text" name="name" id="userName" >
									 <div id="nameAlert"></div></td>
								</tr>

								<tr>
									<th>이메일<span class="req">&nbsp;*</span></th>
									<td><input type="text" name="email" id="email" class="email" >
									 <div id="emailAlert"></div></td>
								</tr>
								<tr>
									<th>전화번호<span class="req">&nbsp;*</span></th>
									<td><input type="text" name="phone" id="phone" class="phone">
										<div id="phoneAlert"></div></td>
								</tr>
								<tr>
									<th>주소<span class="req">&nbsp;*</span></th>
									<td> <input type="text" id="postal" name="post" style="width: 100px" placeholder="우편번호" required readonly/>
										<input type="button" id="postal-search"  value="검색" onclick="addressSearch()" /><br>
										<input type="text" id="userAddress" name="address" placeholder="주소" required  readonly />
										  <input type="text" id="userDetailAddress" name="detailAddr" placeholder="상세 주소"    />
									</td>
								</tr>
								<tr>
									<td colspan="2" class="btn-wrapper">
										<button>제출</button>
									&nbsp; <input
										type="reset" value="초기화" style="width: 80px;"></td>
								</tr>
							</table>
						</form>
						<div id="completeTag" style="display : none;">회원가입성공했습니다. 우측 상단 위 로그인 버튼을 클릭 해 이용해주십시오.</div>
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
const userId = $("#userId").val();
const pwd = $("#pwd").val();
const pwdCheck = $("#pwdCheck").val();
const userName = $("#userName").val();
const email = $("#email").val();
const phone = $("#phone").val();

const idReg = /^[a-z]+[a-z0-9]{5,19}$/; // 앞글자는 영소문자, 영소문자와 숫자만 6 ~ 20자
const pwReg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@!])[a-zA-Z\d@!]{6,20}$/;
//조건1. 6~20 영문 대소문자
//조건2. 최소 1개의 숫자 혹은 특수 문자를 포함해야 함
const nameReg = /^[가-힣]{2,6}$/; // 한글 단어만 2글자 ~ 6글자
const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
const phoneReg = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;// 앞글자는 영소문자, 영소문자와 숫자만 6 ~ 20자
const $userIdAlert = $("#userIdAlert");
const $nameArlert = $("#nameArlert");
const $emailAlert = $("#emailAlert");
const $phoneAlert = $("#phoneAlert");
const $userPwdAlert = $("#userPwdAlert");

//아이디 실시간 유효성검사
$("#userId").on("input", function() {
	    const userId = $(this).val();
	    const $userIdAlert = $("#userIdAlert");

	    if (!idReg.test(userId)) {
	      $userIdAlert
	        .text("아이디는 영소문자로 시작하고 영소문자 및 수자 6~20자만 가능합니다.")
	        .css("color", "red");
	      return;
	    } else {
	      $userIdAlert
	        .text("사용 가능한 아이디 입니다.")
	        .css("color", "blue");
	    }
	  });
//비밀번호 실시간 유효성검사
$("#pwd").on("input", function() {
  const pwd = $(this).val();
  const pwdCheck = $("#pwdCheck").val(); // 비밀번호 확인 값 가져오기
  const $userPwdAlert = $("#userPwdAlert");

  if (!pwReg.test(pwd)) {
    $userPwdAlert
      .text("비밀번호는 영문자 6~20자, 1개의 숫자와 특수문자 ! @ 중 하나를 포함해야 합니다.")
      .css("color", "red");
    return;
  } else {
	 
	  $userPwdAlert
      .text("입력한 비밀번호는 사용가능합니다.")
       .css("color", "blue");
    // 정규식에 맞을 때
	  $("#pwdCheck").on("input", function() {
		  const pwd = $("#pwd").val();
		  const pwdCheck = $(this).val(); // 변경된 비밀번호 확인 값 가져오기
		  const $userPwdAlert = $("#userPwdAlert");

		  if (pwd !== pwdCheck) {
		    $userPwdAlert
		      .text("입력한 비밀번호가 일치하지 않습니다.")
		      .css("color", "red");
		  } else {
		    $userPwdAlert
		      .text("사용 가능한 비밀번호입니다.")
		      .css("color", "blue");
		  }
		});
  }
});

$("#userName").on("input", function() {
	  const userName = $(this).val();
	  const $nameAlert = $("#nameAlert");

	  if (!nameReg.test(userName)) {
	    $nameAlert
	      .text("이름은 한글 단어만 2글자 ~ 6글자까지 가능합니다.")
	      .css("color", "red");
	    return;
	  } else {
	    $nameAlert
	      .text("사용 가능한 이름입니다.")
	      .css("color", "blue");
	  }
	});

	$("#email").on("input", function() {
	  const email = $(this).val();
	  const $emailAlert = $("#emailAlert");

	  if (!emailReg.test(email)) {
	    $emailAlert
	      .text("유효한 이메일 주소를 입력해주세요.")
	      .css("color", "red");
	    return;
	  } else {
	    $emailAlert
	      .text("사용 가능한 이메일 주소입니다.")
	      .css("color", "blue");
	  }
	});

	$("#phone").on("input", function() {
	  const phone = $(this).val();
	  const $phoneAlert = $("#phoneAlert");

	  if (!phoneReg.test(phone)) {
	    $phoneAlert
	      .text("유효한 전화번호를 입력해주세요.")
	      .css("color", "red");
	    return;
	  } else {
	    $phoneAlert
	      .text("사용 가능한 전화번호입니다.")
	      .css("color", "blue");
	  }
	});
	  

document.memberEnrollFrm.onsubmit = (e) => {
  	const userId = $("#userId").val();
  	const idReg = /^[a-z]+[a-z0-9]{5,19}$/;
  	
  	const pwd = $("#pwd").val();
  	const pwdCheck = $("#pwdCheck").val();
  	const pwReg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@!])[a-zA-Z\d@!]{6,20}$/;			
  	
  	const userName = $("#userName").val();
  	const nameReg = /^[가-힣]{2,6}$/;

  	const email = $("#email").val();
  	const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  	
  	const phoneReg = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
  	const phone = $("#phone").val();
  	
  	
  
	  if (!idReg.test(userId)) {
	    e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
	    return false;
	  }
	  
	  if (!nameReg.test(userName)) {
		    e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
		    return false;
		  }
	  
	  if (!pwReg.test(pwd) || pwd !== pwdCheck) {
		    e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
		    return false;
		  }
	  if (!phoneReg.test(phone)) {
		    e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
		    return false;
		  }
	  if (!emailReg.test(email)) {
		    e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
		    return false;
		  }
	  const address = document.querySelector("#userAddress").value;
	  if(address ==="" ){
		  alert("주소입력을해주세요");
		  e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
		    return false;
	  }
	  
	  
	const frmData = new FormData(e.target);
	$.ajax({
		url : "<%= request.getContextPath() %>/member/memberEnroll",
		data : frmData,
		method : "POST",
		dataType : "json",
		processData : false,
		contentType : false,
		success(responseData) {
			console.log(responseData);
			//const {result, message} = responseData;
			//alert(message);
			
			
		},
	//	complete() {
		//	e.target.reset(); // 폼 초기화
		//}
		
	});
	 // 동기적 폼제출 방지
e.preventDefault(); 
document.getElementById('completeTag').style.display = 'block';
document.memberEnrollFrm.style.display = 'none';
document.getElementById('complete').style.backgroundColor = 'green';
document.getElementById('info').style.backgroundColor = '#D2D2D2';
	 
<!-- } 하단 끝 -->
}
			
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>