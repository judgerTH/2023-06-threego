<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginMember</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />
</head>
<body>
	<div class="main_wrap" id="login_new">
        <div class="sub_div">
            <div class="login_div">
    
                <div class="login_wrap">
                    <form action="" name = "LoginFrm">
                        <fieldset>
                            <a href="http://localhost:8080/threego"><img src="<%=request.getContextPath()%>/images/threegoLogo.png" alt="threego logo" id = "login_logo"/></a>
                            <table>
                                <tr>
                                    <td>
                                        <input type="text" name="login_id" id="login_id" placeholder="아이디">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="password" name="login_pwd" id="login_pwd" placeholder="비밀번호">
                                    </td>
                                </tr>
                            </table>
                            <div class="btn-loginMem-wrap">
                                <button type="submit" class = "btn-loginMem" name = "btn-login" id="btn-login">로그인</button>
                                <button type="submit" class = "btn-loginMem" name = "btn-enroll" id = "btn-enroll">회원가입</button>
                            </div>
                        </fieldset>
                    </form>
                    <div class = "searchInfo" name = "searchInfo" id = "searchInfo">
                       <a onclick = "searchID();">아이디찾기</a>
                       <form name = "searchIdFrm" action = "<%= request.getContextPath()%>/member/searchMemberId">
                       |
                       <a onclick = "searchPWD();">비밀번호찾기</a>
                    </div>
                </div>
        
            </div>
    
    
        </div>
    </div>
</body>

<script>

const searchID = () =>{
	
	const title = "searchIDPopup";
	const popup = open("", title, "width = 700px, height = 500px");
	
	const frm = document.searchIdFrm;
	frm.target = title;
	frm.submit();
	
}
const checkIdDuplicate = () =>{
	const title = "checkIdDuplicatePopup";
	const popup = open("", title, "width = 500px, height = 300px");// url 부분은 공백으로!  
	
	
	const frm = document.checkIdDuplicateFrm;
	frm.target = title; // 폼의 제출대상을 팝업창으로 연결
	frm.memberId.value = document.querySelector("#_memberId").value;
	frm.submit();
}

</script>


</html>