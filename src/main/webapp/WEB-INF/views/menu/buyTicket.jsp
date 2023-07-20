<%@page import="com.threego.app.payment.model.vo.Payment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<%
	Payment payment = (Payment)request.getAttribute("payment");
	
	/* System.out.println("jsp ---"  + payment);  */
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신청/구매</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>

<style>
.rider-info-boxes{width : 100vw; height : 600px; display : flex; flex-direction : column; justify-content :center; align-items:center; margin-bottom : 100px;}
.rider-info-box{display : flex; flex-direction : row; justify-content : center; align-items:center;}
#riderimg{width: 600px; border-radius : 10px; box-shadow : 5px 5px 10px 5px #d2d2d2; margin : 40px;}
#application{border: none; border-radius: 50px; width: 250px; text-align: center; padding: 10px; margin-top: 30px; background-color :#468B97; color: white;
		 font-size: 20px; font-weight: bold; }
.rider-text-box{margin : 30px 10px;}

.left-div{display : flex; align-items :center;}
.left-div ul{display : flex; flex-direction : row;  align-items : center; list-style : none;}
.left-div ul li{margin-left : 10px; }
#reqGarbage, #buyTicket {display: inline-block;
	width: 200px;
	border-radius: 15px;
	background-color: #e9e9e9;
	text-align: center;
	line-height: 30px;
	text-decoration: none;
	color: #000000;
	font-size: 20px;}
#reqGarbage:hover, #buyTicket:hover {background-color: #49B466; color: white;}
.btn-submit{border: none; border-radius: 4px; width: 250px; text-align: center; padding: 10px; margin-top: 30px; background-color :#468B97; color: white;
		 font-size: 20px; font-weight: bold; font-family: 'GmarketSansMedium';}
#afterContent {display :flex; flex-direction : column; justify-content:center; text-align : center; align-items :center; margin-bottom : 100px;} 





#mypage-table {border-collapse : collapse;  width : 800px; margin-top : 30px; font-size : 20px;}
#mypage-table th,td{border-top: 2px solid black; border-bottom : 2px solid black; width : 150px; height : 40px;}
#mypage-table td{text-align : left; padding : 5px; height : 60px;}
#mypage-table input{padding : 10px 40px; width : 500px; font-size : 20px; font-family: 'GmarketSansMedium'; border: none;}
.btn-save-box {display: flex; justify-content: center; align-items: center;}
#btn-save{border: none; border-radius: 50px; width: 250px; text-align: center; padding: 10px; margin-top: 20px; background-color :#468B97; color: white;
		 font-size: 20px; font-weight: bold; }
.riderbtn{display : flex; justify-content: center; align-items: center;  }	
#changeAddressBtn{margin : 10px 20px; widht: 100px; height: 30px; border: none; border-radius : 10px; background-color : #9EA1D4; color: white; font-family: 'GmarketSansMedium';}	 
</style>
</head>

<body>
	
	<div class="rider-info-boxes" id="beforeContent">
		<div class="top-div" style = "margin-right: 1000px;">
			<h2>수거신청 소개</h2>
		</div>
		<div class="rider-info-box">
			<img id="riderimg" src="../images/riderinfo.png">
			<div class="rider-text-box">
				<strong style = "font-size : 20px;"><span s>📮</span> &nbsp;수거신청 소개<br>
				</strong> <br>
				<p>
					<span>01. </span>&nbsp;회원가입을 통해 신청하기.
				</p>
			
				<p>
					<span>02. </span>&nbsp; 이용권 구매하기 및 신청버튼 클릭.
				</p>
			
				<p>
					<span>03. </span>&nbsp;수거지역 맞게 설정하기.
				</p>
		
				<p>
					<span>04. </span>&nbsp; 정해진 규격에 맞게 쓰레기 담고, 문앞에 두기.
				</p>
				
				<p>
					<span>05. </span>&nbsp; 📸 문앞에 둔 쓰레기 사진찍기
				</p>
			
				<p>
					<span>06. </span>&nbsp; 사진 첨부 후 수거 신청 버튼 클릭하기.
				</p>
		
			</div>
		</div>
		<div id="riderbtn">
			<button id="application">수거신청 하기</button>
		</div>
	</div>

	<div class="left-div" style="display: none; margin-left : 200px;">
		<h2 style="margin-left : 50px;">신청하기</h2>
		<ul>
			<li><a class="active"  id="reqGarbage" aria-current="page"  id="reqGarbage">수거 신청</a></li>
			<li><a class="active" id="buyTicket" aria-current="page">이용권 구매</a></li>
			
		</ul>
	</div>
	<div id="afterContent">
		<form name="memberUpdateFrm" style="display: none;" id="memberUpdateFrm"
			action="<%= request.getContextPath() %>/payment/insertpayment"
			method="post">
			<table id="mypage-table">
				
				<tbody>
					<tr>
						<th>아이디</th>
						<% if (loginMember != null) { %>
						<td><input type="text" name="id" id="userId"
							value="<%= loginMember.getId() %>" required readonly></td>
						<% } %>
					</tr>
					<tr>
						<th>상품권 종류 <span>*</span></th>
						<td><select name="ticketSelect" id="ticketSelect"
							required="required" onchange="updatePrice()" style ="height : 40px">
								<option value="">선택하세요</option>
								<option value="tic1">1회권 &#8361;5,000원</option>
								<option value="tic3">3회권 &#8361;15,000원</option>
								<option value="tic5">5회권 &#8361;23,900원</option>
								<option value="tic10">10회권 &#8361;46,900원</option>
						</select></td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td><input type="text" name="price" id="priceInput"
							required="required" readonly> <br>
							<div id="gunroinfo" style="font-size: 12px;">중복구매가 불가하오니
								이용중인 상품권이 있으면 소진 후 구매 부탁드립니다.</div></td>
					</tr>
					
					<tr>
						<th>입금계좌</th>
						<td>카카오뱅크 : 3333-1111-9999 <br> 예금주 명 : 황대호 <br> <br>
							<div id="gunroinfo" style="font-size: 12px;">중복구매가 불가하오니
								이용중인 상품권이 있으면 소진 후 구매 부탁드립니다.</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="riderbtn">
				<button type="button"  class = "btn-submit" id="paysubmit" onclick="showPaymentPopup()">구매
					신청</button>
			</div>
		</form>
	</div>
	
	<div id="afterContent">
  <form name="reqGarbagePickupFrm" style="display: none;" id="reqGarbagePickupFrm">
    <table id="mypage-table">
      
      <tbody>
        <tr>
          <th>아이디</th>
          <% if (loginMember != null) { %>
          <td><input type="text" name="id" id="id" value="<%= loginMember.getId() %>" required readonly></td>
          <% } %>
        </tr>
        <tr>
          <th>이름</th>
          <% if (loginMember != null) { %>
          <td><input type="text" name="name" id="name" value="<%= loginMember.getName() %>" required readonly></td>
          <% } %>
        </tr>
        <tr>
          <th>우편번호</th>
          <% if (loginMember != null) { %>
          <td><input type="text" name="post" id="postalCode" value="<%= loginMember.getPost() %>" required readonly></td>
          <% } %>
        </tr>
        <tr>
          <th>주소</th>
          <% if (loginMember != null) { %>
          <td><input type="text" name="address" id="address" value="<%= loginMember.getAddress() %>" required readonly>
            <button type="button" id="changeAddressBtn" onclick="addressSearch()">주소 변경</button></td>
          <% } %>
        </tr>
        <tr>
          <th>상세주소</th>
          <td><input type="text" name="detailAddress" id="detailAddress"></td>
        </tr>
        <tr>
          <th>잔여 이용권</th>
          <% if (loginMember != null) { %>
          <td><input type="text" name="pCnt" id="remainingTicket" value="<%= payment.getP_cnt() %>" required readonly></td>
          <% } %>
        </tr> 
        <tr>
          <th>사진 첨부 파일</th>
          <td>
            <input type="file" name="photo" id="photoInput" accept="image/jpeg, image/png" onchange="displayPhotoPreview(this)" required>
<div id="photoPreviewContainer" style="width: 200px; height: 200px; margin-top: 10px;"></div>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="riderbtn">
      <button type="submit" class = "btn-submit" id="reqsubmit" >수거 신청</button>
    </div>
  </form>
</div>
	
	

	<script>
	
	reqGarbage.onclick = () => {
		document.getElementById('reqGarbagePickupFrm').style.display="block";
		document.getElementById('memberUpdateFrm').style.display="none";
	}
	
	
	buyTicket.onclick = () => {
		document.getElementById('memberUpdateFrm').style.display="block";
		document.getElementById('reqGarbagePickupFrm').style.display="none";
		console.log('<%= payment.getP_cnt() %>');
	}
	
	
	paysubmit.onclick =()=>{
		if('<%= payment.getP_cnt() %>' > 0 ){
			alert("이용권이 이미 있습니다.");
			  window.location.reload();
			return;
		}
		
	 const selectElement = document.getElementById('ticketSelect');
	 const selectedOption = selectElement.options[selectElement.selectedIndex];
		  // 상품권 종류 선택 여부 확인
		  if (selectedOption.value === '') {
		    alert('상품권 종류를 선택해주세요.');
		    return; // 선택되지 않았을 경우 함수 종료
		  }
		const frm = document.memberUpdateFrm;
		alert("구매가 완료되었습니다.");
		frm.submit();
		 // 폼 제출 후 새로고침
		  
		  
	}
	
function updatePrice() {
	  const selectElement = document.getElementById('ticketSelect');
	  const priceInput = document.getElementById('priceInput');
	  const selectedOption = selectElement.options[selectElement.selectedIndex];

	  if (selectedOption.value === '') {
	    priceInput.value = '';
	  } else {
	    priceInput.value = selectedOption.text.split(' ')[1];
	  }
	}

	application.onclick=(e)=>{
		<%if(loginMember == null) {%>
		alert("로그인 후 이용 가능합니다."); <%}else{%>
		document.getElementById('reqGarbagePickupFrm').style.display="block";
		document.querySelector("#beforeContent").style.display="none";
		document.querySelector(".left-div").style.display="block";
		
		<%}%>
	}
	
	document.reqGarbagePickupFrm.onsubmit = (e) => {
		<% if (payment.getP_cnt() == 0 || payment == null){ %>
			alert("이용권이 모두 소진되었습니다. 이용권 구매후 신청해주세요.");
			return;
			  window.location.reload();
		<%}%>
		
		
		const frmData = new FormData(e.target);
		  for(const name of frmData.keys())
	            console.log(`\${name}=\${frmData.get(name)}`);
		  
		  
		  $.ajax({
			  url: "<%=request.getContextPath()%>/request/reqGarbagePickup",
			  data: frmData,
			  method: "POST",
			  dataType: "json",
			  processData: false,
			  contentType: false,
			  success: function(response) {
			    if (response.result === "성공") {
			      const uesPayment = response.uesPayment;
			      document.querySelector("#remainingTicket").value = uesPayment.p_cnt;
			      alert("신청이 성공적으로 처리되었습니다.");
			      window.location.href = "<%=request.getContextPath()%>/member/requestList?memberId=<%=loginMember.getId()%>";
			    } else if (response.result === "실패") {
			      alert("이용권이 모두 소진되었습니다. 이용권 구매 후 신청해주세요.");
			      window.location.reload();
			    } else {
			      alert("알 수 없는 오류가 발생했습니다.");
			      window.location.reload();
			    }
			  },
			  error: function() {
			    alert("신청을 처리하는 동안 오류가 발생했습니다.");
			  },
			});
		e.preventDefault();
		};
		

		// 기본 설정: 폼 초기화
		const reqGarbagePickupFrm = document.getElementById("reqGarbagePickupFrm");
		reqGarbagePickupFrm.style.display = "none";
	
	
	
	</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    function addressSearch() {
        new daum.Postcode({
            oncomplete: function(data) {

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
                document.getElementById('postalCode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    function displayPhotoPreview(input) {
    	  if (input.files && input.files[0]) {
    	    var reader = new FileReader();

    	    reader.onload = function(e) {
    	      var photoPreviewContainer = document.getElementById('photoPreviewContainer');
    	      photoPreviewContainer.innerHTML = "<img src='" + e.target.result + "' style='width: 100%; height: 100%;'>";
    	    };

    	    reader.readAsDataURL(input.files[0]);
    	  }
    	}
    
</script>
	

</body>

</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
