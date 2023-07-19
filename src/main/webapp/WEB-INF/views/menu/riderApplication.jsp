<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<% String msg = (String) session.getAttribute("msg"); %>
<% session.removeAttribute("msg"); %>

<script>
    // msg 값이 있을 경우 alert 창으로 출력
    <% if (msg != null) { %>
        alert("<%= msg %>");
    <% } %>
</script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쓰리고 | 이용방법</title>
<style>
.rider-info-boxes{width : 100vw; height : 600px; display : flex; flex-direction : column; justify-content :center; align-items:center;}
.rider-container {display : flex; flex-direction : column; justify-content : center; align-items:center;}
#beforeContent{display : flex; flex-direction : column; justify-content : center; margin-bottom : 100px;}
.rider-info-box {display : flex; flex-direction : row;}
#riderimg{width: 600px; border-radius : 10px; box-shadow : 5px 5px 10px 5px #d2d2d2; margin : 40px;}
#application{border: none; border-radius: 50px; width: 250px; text-align: center; padding: 10px; margin-top: 30px; background-color :#468B97; color: white;
		 font-size: 20px; font-weight: bold; }
.rider-text-box{margin : 30px 10px;}
.riderbtn{display : flex; justify-content: center; align-items: center; }
#afterContent{
	display : none;
	width : 100vw;
	height : 600px;
	margin-top : 30px;
	margin-bottom : 100px;
}
#afterContent table {
    margin: 0 auto;
  
}



#afterContent table td input {
    margin: 10px 0;
    padding: 5px;
}

.mypage-table {border-collapse : collapse; width : 850px; margin-top: 30px;}
.mypage-table th, td {border-top: 2px solid black; border-bottom : 2px solid black; width : 250px; height : 70px;}
.mypage-table th {font-size : 20px;}
.mypage-table td{text-align : left; padding : 5px; }
.mypage-table input{padding : 30px 40px; width : 300px; height : 40px; font-size : 15px; font-family: 'GmarketSansMedium';}
.btn-save-box {display: flex; justify-content: center; align-items: center;}
#ridersubmit{border: none; border-radius: 4px; width: 250px; text-align: center; padding: 10px; margin-top: 30px; background-color :#468B97; color: white;
		 font-size: 15px; font-weight: bold; }
</style>
</head>
<body>
	<div class="rider-container" >
		<div class="top-div" style = "margin-right: 1000px;">
			<h2>수고미 지원안내</h2>
		</div>

		<div class="rider-info-boxes" id="beforeContent">
			<div class="rider-info-box">
				<img id="riderimg" src="../images/riderinfo.png">
				<div class="rider-text-box">
					<strong style = "font-size : 20px;"> <span>📮</span> &nbsp;수고미 소개<br>
					</strong> <br>
					<p>
						<span>01. </span>&nbsp;회원가입을 통해 지원하기.
					</p>
					
					<p>
						<span>02. </span>&nbsp;수거미 지원을 통해 수거미 자격 얻기.
					</p>
					
					<p>
						<span>03. </span>&nbsp;수거지역 설정하기.
					</p>
			
					<p>
						<span>04. </span>&nbsp;고르고 싶은 지역 골라 수거신청하기.
					</p>
				
					<p>
						<span>05. </span>&nbsp;문앞에 놓인 박스를 정해진 지역에 버리기
					</p>
					
					<p>
						<span>06. </span>&nbsp;완료 후 완료 버튼 클릭하기.
					</p>
					
				</div>
				<br>

			</div>
		<div id="riderbtn">
			<button id="application">수고미 지원하기</button>
		</div>
		</div>

	
	<div id="afterContent" >
		<form name="memberUpdateFrm"
			action="<%= request.getContextPath() %>/member/memberUpdate"
			method="post">
			<table class="mypage-table">
				<tbody>
					<tr>
						<th>아이디</th>
						<%if(loginMember != null){%>
						
						<td> 
						<input type="text" name="id" id="userId" value="<%= loginMember.getId() %>" required readonly></td><%}%>
					</tr>
					<tr>
						<th>수거지역 <span>*</span>
						</th>
						<td><select name="location" id="celeb-enroll-type" required="required" style="font-size : 20px;">
								<option value="">선택하세요</option>
								<option value="S1">강남구,서초구</option>
								<option value="S2">송파구, 강동구</option>
								<option value="S3">광진구, 성동구</option>
						</select></td>
					</tr>
					<tr>
						<th> 근로계약서</th>
						<td>
						<img src="<%= request.getContextPath() %>/images/pdf.png" alt="" style="width:16px;" />
						<a href="<%=request.getContextPath() %>/upload/쓰리고근로계약서.pdf" download>근로계약서 다운로드</a>
						<br><div id="gunroinfo" style="font-size: 12px;">근로계약서 파일은 다운로드 후 확인 및 서명기입 후 제출 부탁드립니다.</div>
						</td>
					</tr>
					<tr>
						<th>첨부파일
						</th>
						<td>
						<input type="file" name="upFile" required="required">
						</td>
					</tr>
				</tbody>
			</table>
			<div class="riderbtn">
			<button type="submit" id="ridersubmit">수고미 지원하기</button></div>
		</form>
		

	</div>
	<form id="riderComplete" style="display: none;">
						<div>  라이더지원이 완료되어습니다. 관리자 확인 후 1:1 메세지 함으로 연락드리겠습니다.</div></form>
</div>
</body>
<script>


application.onclick=(e)=>{
	<%if(loginMember == null) {%>
	alert("로그인 후 이용 가능합니다.");<%}else{%>
	<%if(loginMember.getMemberRole() == MemberRole.R){%>
	alert("라이더 지원 상태이거나, 이미 라이더인 회원은 지원 불가 합니다."); <%}else{%>
	
	document.querySelector("#beforeContent").style.display="none";
	document.querySelector("#afterContent").style.display="block";
	<%}}%>
	
	
}
document.memberUpdateFrm.onsubmit=(e)=>{
	
	if(confirm("근로계약서에 서명 및 날짜기입을 정확하게 하셨습니까?")){
		const frmData = new FormData(e.target);
		  for(const name of frmData.keys())
	            console.log(`\${name}=\${frmData.get(name)}`);
		$.ajax({
			url : "<%= request.getContextPath() %>/rider/riderApplication",
			data : frmData,
			method : "POST",
			dataType : "json",
			processData : false,
			contentType : false,
			success(responseData) {
				console.log(responseData);
				const {result, message} =  responseData;
				if(result =="실패"){
					alert(message);
				}else{
				document.querySelector("#afterContent").style.display="none";
				document.querySelector("#riderComplete").style.display="block";
					
				}
				
				
				
			},
			
			
		});
		e.preventDefault(); 
		
	}
}
</script>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
