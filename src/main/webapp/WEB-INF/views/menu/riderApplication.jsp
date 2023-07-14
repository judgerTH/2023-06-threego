<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쓰리고 | 이용방법</title>
<style>
h2 {
	display: block;
	font-size: 1.5em;
	margin-block-start: 0.83em;
	margin-block-end: 0.83em;
	margin-inline-start: 21%;
	margin-inline-end: 0px;
	font-weight: bold;
}

strong {
	letter-spacing: -1px;
	font-weight: bolder;
	font-size: 1.3rem !important;
}

span {
	color: #49B466;
}

p {
	letter-spacing: -1px;
	padding-top: 6px;
	font-size: 1rem !important;
	word-break: keep-all;
	margin-top: 0;
	margin: 0;
}

.rider-text-box {
	padding: 1.5rem;
}

.rider-info-bg-box1 {
	box-shadow: 1px 2px 8px #c0c0c04d;
	border-radius: 20px;
	height: 470px;
	background-size: cover;
	background-repeat: no-repeat;
	width: 500px;
	margin-bottom: 5%;
	margin-left: 50px;
}

.rider-container {
	position: relative;
	width: 100%;
	padding-right: var(--bs-gutter-x, .75rem);
	padding-left: var(--bs-gutter-x, .75rem);
	margin-right: auto;
	margin-left: auto;
	height: auto; /* Adjust the height as needed */
}

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

/** 박스 이미지 사이즈, 위치 조절*/
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
#afterContent{
	display : none;
	width : 100%;
	height : 50%;
}
#afterContent table {
    margin: 0 auto;
    border: 1px solid #D2D2D2;
    border-collapse: collapse;
}

#afterContent table tr {
    border: 1px solid #D2D2D2;
    padding: 5px;
}

#afterContent table td input {
    margin: 10px 0;
    padding: 5px;
}
#ridersubmit{

width: 400px;
	height: 50px;
	background-color: #49B466;
	color: white;
	font-weight: bold;
	font-size: 20px;
	border: none;
}

.riderbtn {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.riderbtn button {
	width: 400px;
	height: 50px;
	background-color: #49B466;
	color: white;
	font-weight: bold;
	font-size: 20px;
	border: none;
}
#riderComplete{
	width : 80%;
	margin : 0 auto;
    height: 500px;
    margin: 0 auto;
    font-size: 25px;
    padding-top: 200px;
    font-weight: bold;
    text-align: center;
}
</style>
</head>
<body>
	<div class="rider-container" >
		<div class="top-div">
			<h2>수고미 지원안내</h2>
		</div>

		<div class="rider-info-boxes" id="beforeContent">
			<div class="rider-info-box">
				<img id="riderimg" src="../images/riderinfo.png">
				<div class="rider-text-box">
					<strong> <span>📮</span> &nbsp;수고미 소개<br>
					</strong> <br>
					<p>
						<span>01. </span>&nbsp;회원가입을 통해 지원하기.
					</p>
					<br>
					<p>
						<span>02. </span>&nbsp;수거미 지원을 통해 수거미 자격 얻기.
					</p>
					<br>
					<p>
						<span>03. </span>&nbsp;수거지역 설정하기.
					</p>
					<br>
					<p>
						<span>04. </span>&nbsp;고르고 싶은 지역 골라 수거신청하기.
					</p>
					<br>
					<p>
						<span>05. </span>&nbsp;문앞에 놓인 박스를 정해진 지역에 버리기
					</p>
					<br>
					<p>
						<span>06. </span>&nbsp;완료 후 완료 버튼 클릭하기.
					</p>
					<br>
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
			<table class="mypage-table"  style= "width : 800px; height :400px; margin : 0 auto;">
				<tbody>
					<tr>
						<th>아이디</th>
						<%if(loginMember != null){%>
						
						<td> 
						<input type="text" name="id" id="userId" value="<%= loginMember.getId() %>"></td><%}%>
					</tr>
					<tr>
						<th>수거지역 <span>*</span>
						</th>
						<td><select name="location" id="celeb-enroll-type" required="required">
								<option value="">선택하세요</option>
								<option value="S1">강남구,서초구</option>
								<option value="S2">송파구, 강동구</option>
								<option value="S3">광진구, 성동구</option>
						</select></td>
					</tr>
					<tr>
						<th>약관 동의 및 근로계약서</th>
						<td>
						<a href="<%=request.getContextPath() %>/upload/쓰리고근로계약서.pdf" download>근로계약서 다운로드</a>
						<br>근로계약서 파일은 다운로드 후 꼭 읽어보시고 서명 후 제출 부탁드립니다.
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
	document.querySelector("#beforeContent").style.display="none";
	document.querySelector("#afterContent").style.display="block";
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
				//const {result, message} = responseData;
				//alert(message);
				
				
			},
		//	complete() {
			//	e.target.reset(); // 폼 초기화
			//}
			
			
		});
		e.preventDefault(); 
		document.querySelector("#afterContent").style.display="none";
		document.querySelector("#riderComplete").style.display="block";
	}
}
</script>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
