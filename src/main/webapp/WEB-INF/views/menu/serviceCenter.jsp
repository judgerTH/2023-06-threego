<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쓰리고 | 회원정보수정</title>
    <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
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
            color: #363636;
            font-size: large;
            font-weight: bolder;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 190px;
        }
        
       .right-div {
	    flex: 1;
	    margin-left: 590px;
	    flex-direction: column;
	    display: flex;
	    flex-wrap: wrap;
	    width: 1200px;
	    
		}
    	.con {
		    float: left;
		}
		
		h2 {
	    margin-left: 60px;
		}
       .mypage-wrap {
	    padding-top: 5rem;
	    padding-bottom: 7rem;
	    padding-left: 10rem;
		}
        .mypage-wrap .mypage-table {
	    border-top: 2px solid #222222a7;
	    margin-top: 6px;
	    margin-bottom: 13px;
		}
		
		tbody, td, tfoot, th, thead, tr {
	    border-color: inherit;
	    border-style: solid;
	    border-width: 0;
		}
		
		.mypage-wrap .mypage-table th:first-child {
		    color: #222222e0;
		    font-weight: 900;
		}
		
		.mypage-wrap .mypage-table td:not(.mypage-wrap .mypage-table .content td),
        .mypage-wrap .mypage-table th:not(.mypage-wrap .mypage-table .content th) {
            height: 61px;
            border-bottom: 1px solid #e3e0e0;
            font-size: 16px;
            text-align: left;
        }

        input {
        border: 1px solid #d0d3db;
        background: #fff;
        color: #000;
        vertical-align: middle;
        border-radius: 3px;
        padding: 5px;
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.119);
        }
		
        span {
            color: #248739;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <div id="container_wr">
        <div id="con">
         <script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
    <div class="mypage-wrap">
        <div class="container">
            <div>
                <div class="left-div">
                <h2>고객센터</h2>
                    <ul>
                        <li class="active"><a class="" aria-current="page" href="">공지사항</a></li>
                        <li><a class="" aria-current="page" href="">이용문의</a></li>
                    </ul>        
                </div>
            </div>
            <div class="right-div">
                <h3>회원정보 수정</h3>
                <div class="new-mypage-form-box">
                    <form name="memberUpdateFrm" action="<%= request.getContextPath() %>/member/memberUpdate" method="post" >                
                        <table class ="mypage-table">
                            <tbody>
                            <tr>
                                <th>
                                    아이디
                                </th>
                                <td>
                                <%= memberId %>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    이름
                                </th>
                                <td>
                                <%= name %>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    비밀번호 <span>*</span>
                                </th>
                                <td>
                                    <input type="password" id="pwd" name="mb_password" minlength="3" maxlength="20" placeholder="비밀번호">
                                    <span>(영문 대소문자/숫자/특수문자 조합, 10자~16자)</span>
                                <div id="userPwdAlert"></div></td>
                            </tr>
                            <tr>
                                <th>
                                    비밀번호 확인 <span>*</span>
                                </th>
                                <td>
                                    <input type="password"  id="pwdCheck" name="mb_password_re" minlength="3" maxlength="20" placeholder="비밀번호 확인">
                                </td>
                            </tr>
    
                            <tr>
                                <th>
                                    휴대전화 <span>*</span>
                                </th>
                                <td>
                                    <input type="text" id="phone" name="mb_tel" value="<%= phone %>" required maxlength="20" placeholder="전화번호">
                                <div id="phoneAlert"></div> </td>
                            </tr>
                            <tr>
                                <th>
                                    이메일 <span>*</span>
                                </th>
                                <td>
                                    <input type="text" id="email"  name="mb_email" value="<%= email %>" required size="70" maxlength="100" placeholder="E-mail">
                                <div id="emailAlert"></div> </td>
                            </tr>
                            <tr>
                                <th>
                                    주소 <span>*</span>
                                </th>
                                <td>
                                        <label for="reg_mb_zip" class="sound_only">우편번호 (필수)</label>
                                        <input type="text" id="postal" name="mb_zip" value="<%= post %>"  required  size="5" maxlength="6"  placeholder="우편번호">
                                        <button type="button"  id="postal-search" class="btn_frmline" onclick="addressSearch()">주소 검색</button><br><br>
                                        <input type="text" id="userAddress" name="mb_addr1" value="<%= addr1 %>" required size="50"  placeholder="기본주소">
                                        <label for="reg_mb_addr1" class="sound_only">기본주소 (필수)</label><br><br>
                                        <input type="text" name="mb_addr2" value="<% %>" size="50" placeholder="상세주소">
                                        <label for="reg_mb_addr2" id="userDetailAddress"  class="sound_only">상세주소</label><br><br>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="f_btn">
                            <button type="submit" class="btn">
                                변경사항 저장하기
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
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
const pwd = $("#pwd").val();
const pwdCheck = $("#pwdCheck").val();
const email = $("#email").val();
const phone = $("#phone").val();

const pwReg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@!])[a-zA-Z\d@!]{6,20}$/;
const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
const phoneReg = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;

const $emailAlert = $("#emailAlert");
const $phoneAlert = $("#phoneAlert");
const $userPwdAlert = $("#userPwdAlert");

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
	  
document.memberUpdateFrm.onsubmit = (e) => {
	const pwd = $("#pwd").val();
  	const pwdCheck = $("#pwdCheck").val();
  	const pwReg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@!])[a-zA-Z\d@!]{6,20}$/;		
  	
	const email = $("#email").val();
  	const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  	
  	const phoneReg = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
  	const phone = $("#phone").val();
  	
  	let cnt = 0;
  	 if (!pwReg.test(pwd) || pwd !== pwdCheck) {
		    e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
		  }else{
			  cnt++;
		  }
  	 
	  if (!phoneReg.test(phone)) {
		    e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
		  }else{
			  cnt++;
		  }
	  
	  if (!emailReg.test(email)) {
		    e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
		  }else{
			  cnt++;
		  }
	  
	  const address = document.querySelector("#userAddress").value;
	  if(address ==="" ){
		  e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
	  }else{
		  cnt++;
	  }
	  
	  if (cnt !== 4) {
		    e.preventDefault();
		    alert("모든 항목을 기입 후 버튼을 눌러주세요.");
		    return false;
		  }
};


</script>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>