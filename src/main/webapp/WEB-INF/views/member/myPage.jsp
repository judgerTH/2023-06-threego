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
                <h2>마이페이지</h2>
                    <ul>
                        <li class="active"><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/myPage">회원정보 수정</a></li>
                        <li><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/requestList">수거신청 내역</a></li>
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
                                    <input type="password" name="mb_password" value="<%= password %>" minlength="3" maxlength="20" placeholder="비밀번호">
                                    <span>(영문 대소문자/숫자/특수문자 조합, 10자~16자)</span>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    비밀번호 확인 <span>*</span>
                                </th>
                                <td>
                                    <input type="password" name="mb_password_re"  value="<%= password %>"minlength="3" maxlength="20" placeholder="비밀번호 확인">
                                </td>
                            </tr>
    
                            <tr>
                                <th>
                                    휴대전화 <span>*</span>
                                </th>
                                <td>
                                    <input type="text" name="mb_tel" value="<%= phone %>" required maxlength="20" placeholder="전화번호">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    이메일 <span>*</span>
                                </th>
                                <td>
                                    <input type="text" name="mb_email" value="<%= email %>" required size="70" maxlength="100" placeholder="E-mail">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    주소 <span>*</span>
                                </th>
                                <td>
                                        <label for="reg_mb_zip" class="sound_only">우편번호 (필수)</label>
                                        <input type="text" name="mb_zip" value="<%= post %>"  required  size="5" maxlength="6"  placeholder="우편번호">
                                        <button type="button" class="btn_frmline" onclick="">주소 검색</button><br>
                                        <input type="text" name="mb_addr1" value="<%= addr1 %>" required size="50"  placeholder="기본주소">
                                        <label for="reg_mb_addr1" class="sound_only">기본주소 (필수)</label><br>
                                        <input type="text" name="mb_addr2" value="<% %>" size="50" placeholder="상세주소">
                                        <label for="reg_mb_addr2" class="sound_only">상세주소</label>
                                        <input type="hidden" name="mb_addr_jibeon" value="R">
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
<script>
document.memberUpdateFrm.onsubmit = (e) => {
	
	const frm = e.target;
	const phone = e.target.mb_tel;
	
	console.log(frm, phone);
	// 전화번호 검사 - 01012345678 010으로 시작하고 숫자8자리 여부 확인
	if (!/^010\d{8}$/.test(phone.value)) {
		alert("전화번호는 010으로 시작하고 숫자8자리여야 합니다.");
		return false;
	}
	
};
</script>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>