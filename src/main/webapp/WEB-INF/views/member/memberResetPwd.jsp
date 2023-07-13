<%@page import="com.threego.app.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
</head>
<body>
<%
	Member member = (Member)request.getAttribute("searchedMember");
	
	
%>
<div class="search-wrapper">
        <div class="search-subwrapper">
            <h2>비밀번호 재설정</h2>
            <p>비밀번호를 재설정하시기 바랍니다.</p>
            <form name = "resetPwdFrm">
            <p id = "userPwdAlert"></p>
            <input type="password" class= "search-input" name="reset-pwd" id="reset-pwd" placeholder="재설정 비밀번호">
            <input type="password" class= "search-input" name="reset-pwd-confirm" id="reset-pwd-confirm" placeholder="재설정 비밀번호 확인">
            <input type = "hidden" name = "searchedId" value = "<%=member.getId()%>">
            <button id="btn-searchId" type = "submit">비밀번호 재설정</button>
            </form>
        </div>
</div>

</body>
<script>

const pwReg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@!])[a-zA-Z\d@!]{6,20}$/;	
	
//비밀번호 실시간 유효성검사
$("#reset-pwd").on("input", function() {
  const pwd = $(this).val();
  const pwdCheck = $("#reset-pwd-confirm").val(); // 비밀번호 확인 값 가져오기
  const $userPwdAlert = $("#userPwdAlert");
  
  if (!pwReg.test(pwd)) {
    $userPwdAlert
      .text("비밀번호는 영문자 6~20자, 1개의 숫자와 특수문자 ! @ 중 하나를 포함해야 합니다.")
      .css("color", "red");
    return false;
    
  } else {
      $userPwdAlert
      .text("입력한 비밀번호는 사용가능합니다.")
       .css("color", "blue");
    // 정규식에 맞을 때
      $("#reset-pwd-confirm").on("input", function() {
          // const pwd = $("#pwd").val();
          const pwdCheck = $(this).val(); // 변경된 비밀번호 확인 값 가져오기
          // const $userPwdAlert = $("#userPwdAlert");

          if (pwd !== pwdCheck) {
            $userPwdAlert
              .text("입력한 비밀번호가 일치하지 않습니다.")
              .css("color", "red");
           	return false;
            
          } else {
            $userPwdAlert
              .text("사용 가능한 비밀번호입니다.")
              .css("color", "blue");
          }
        });
  }
});

document.resetPwdFrm.onsubmit = (e) => {
  
  	const pwd = $("#reset-pwd").val();
  	const pwdCheck = $("#reset-pwd-confirm").val();
  			
  	if(!pwReg.test(pwd)){
  		e.preventDefault();
  		return false;
  	}
  
	if (!pwReg.test(pwd) || pwd !== pwdCheck) {
	   e.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
	   return false;
	}
	
	const frmData = new FormData(e.target);
	
	$.ajax({
		url : "<%=request.getContextPath()%>/member/memberResetPwd", 
		data : frmData,
		method : "POST", 
		dataType : "json", 
		processData : false,
		contentType : false, 
		success(responseData){
			console.log(responseData);
			const{result, id} = responseData;
			alert(result);
		}, 
		complete(){
			window.close();
				
		}
		
	})
	e.preventDefault();
};


	
	
	
	
	






</script>
</html>