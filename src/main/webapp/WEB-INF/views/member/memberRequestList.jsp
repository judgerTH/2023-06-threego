<%@page import="com.threego.app.request.model.vo.Request"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    <% 
   		 String memberId = loginMember.getId();
    	List<Request> requestList = (List<Request>) request.getAttribute("requestList");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
	    padding-bottom: 7rem;
	    padding-left: 10rem;
		}
        
        .mypage-wrap .mypage-table {
	    border-top: 2px solid #222;
	    margin-top: 6px;
	    margin-bottom: 13px;
		}
		
		tbody, td, tfoot, th, thead, tr {
	    border-color: inherit;
	    border-style: solid;
	    border-width: 0;
		}
		
		.mypage-wrap .mypage-table tr:first-child {
		    background: #f0f0f0;
		    font-weight: 500;
		}
		
		.mypage-wrap .mypage-table td:not(.mypage-wrap .mypage-table .content td) {
		    height: 61px;
		    border-bottom: 1px solid #c2c2c2;
		    font-size: 16px;
		    text-align: center;
		}
		
		.mypage-wrap .mypage-table:not(.service-center) td:first-child {
	    width: 18%;
		}
		
		.empty_table {
		    padding: 50px 0 !important;
		    text-align: center;
		}
		
		.container {
		    float: left;
		}
		
		.container h2 {
		    margin-left: 60px;
		}
		
		#btn-warning {
	border: none;
	border-radius: 3px;
	background-color: red;
	color: white;
	padding: 5px 15px;
	font-weight: bold;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 60%;
	max-width: 600px;
	position: relative; /* 추가된 속성 */
}

.modal-close {
	color: #aaa;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
	position: absolute; /* 추가된 속성 */
	top: 10px; /* 상단 여백 */
	right: 10px; /* 우측 여백 */
}

.modal-close:hover, .modal-close:focus {
	color: #000;
	text-decoration: none;
}

/* 신고 폼 스타일 */
#warningMadal form {
	display: flex;
	flex-direction: column;
}

#warningMadal form span {
	margin-bottom: 10px;
}

#warningMadal form input, #warningMadal form textarea {
	margin-bottom: 10px;
	padding: 5px;
}

#warningMadal form button[type="submit"] {
	padding: 10px;
	background-color: #49B466;
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

#warningMadal form button[type="submit"]:hover {
	background-color: #24873a;
}

.close {
	display: flex;
	flex-direction: row-reverse;
	font-size: 30px; /* 닫기 버튼의 크기 조절 */
	font-weight: bold;
}
    </style>
</head>
<body>
    <div id="wrapper">
        <div id="container_wr">
        <div id="container">
    <div class="mypage-wrap">
        <div class="container">
            <div>
                <div class="left-div">
                <h2>마이페이지</h2>
                    <ul>
                       <li><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/myPage">회원정보 수정</a></li>
                        <li><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/paymentList?memberId=<%= memberId %>">결제정보</a></li>
                        <li class="active"><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/requestList?memberId=<%= memberId %>">수거신청목록</a></li>
                        <li><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/notebox">📑받은 메시지</a></li>
                    </ul>        
                </div>
            </div>
            </div>
            <div class="right-div">
                <h3>수거신청목록 조회</h3>
                <table class="mypage-table">
                    <tbody>
                        <tr>
                            <td>NO</td>
                            <td>접수현황</td>
                            <td>접수일자</td>
                            <td>배정 라이더</td>
                            <td>완료일자</td>
                        </tr>
                        <tr>
                        <% int count = 1; %>
                   		<% if(requestList.isEmpty() || requestList == null) { %>
                        	<td colspan="7" class="empty_table">수거신청 내역이 없습니다.</td>
                        </tr>
                        <% } else {
                        			for(Request reqList : requestList) {	 %>
                        <tr>
                        <td><%= count++%></td>
                        <td>
				                <%= (reqList.getReqStatus().equals("0")) ? "수거 대기중" :
				                    (reqList.getReqStatus().equals("1")) ? "수거중" :
				                    (reqList.getReqStatus().equals("2")) ? "수거완료" :
				                    (reqList.getReqStatus().equals("3")) ? "수거취소" : "" %>
		           		</td>
                        <td><%= reqList.getReqDate() %></td>
                        <td><%= reqList.getReqRider() %>
						    <% if (reqList.getReqStatus().equals("1") || reqList.getReqStatus().equals("2")) { %>
						       	<form name="requestwarningForm" style="display: inline;">
												<input type="hidden" name="reqNo"
													value="<%= reqList.getReqNo()%>"> <input
													type="hidden" name="memberId"
													value="<%=loginMember.getId()%>">
												<button type="button" id="btn-warning"
													onclick="openModal(this)">라이더 신고</button>
											</form>
						    <% } %>
						</td>
                        <td><%= reqList.getReqCpDate() == null ? "미완료" : reqList.getReqCpDate() %></td>
                        <% 		}
                        		}
                       	%>
                        </tr>           
                     </tbody>
                </table>
            </div>
        </div>
    </div>
    	<div id="warningMadal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h3>신고하기</h3>
			<form name="warningForm"
				action="<%= request.getContextPath()%>/warning/memberSendwarning"
				method="post">
				<span>요청 번호</span><input type="text" name="reqNo" value="" required
					readonly><br> <span>신고자 아이디</span><input type="text"
					name="memberId" value="" required readonly>
				<!-- 신고 폼 요소들 추가 -->
				<textarea name="warningReason" placeholder="신고 사유를 입력하세요"
					style="width: 587px; height: 200px;"></textarea>
				<button type="submit">신고 제출</button>
			</form>
		</div>
	</div>
    <script>

// 모달 열기
function openModal(button) {
  const reqNo = button.parentNode.querySelector('input[name="reqNo"]').value;
  const memberId = button.parentNode.querySelector('input[name="memberId"]').value;
  const warningMadal = document.getElementById("warningMadal");
  const modalClose = warningMadal.querySelector(".modal-close");
  // warningMadal은 모달요소의 DOm 객체를 가리키는데 클래스선택자를 통해 닫기버튼, 외부영역 을 변수에 할당하여 닫히게만든것~
  const modalOverlay = warningMadal.querySelector(".modal-overlay");

  // 모달 내의 필요한 요소들에 값을 할당
  warningMadal.querySelector('input[name="reqNo"]').value = reqNo;
  warningMadal.querySelector('input[name="memberId"]').value = memberId;

  // 모달 열기
  warningMadal.style.display = "block";

  // 모달 닫기
  modalClose.addEventListener("click", closeModal);
  modalOverlay.addEventListener("click", closeModal);

  function closeModal() {
    warningMadal.style.display = "none";
  }

  // 모달 닫기 버튼 클릭 이벤트 설정
  modalClose.addEventListener("click", closeModal);
  modalOverlay.addEventListener("click", closeModal);
}

// 모달 닫기
function closeModal() {
  const warningMadal = document.getElementById("warningMadal");
  warningMadal.style.display = "none";
}


document.warningForm.onsubmit = (e) => {
	  const content = e.target.warningReason.value;
	  
	  // 문자로만 이루어져 있는지 확인
	  if (content.replace(/\s/g, "").length < 1) {
	    alert("최소 1글자 이상의 값을 입력해주세요.");
	    return false;
	  }
	  
	  alert ("신고요청이 접수되었습니다. 더 나은 쓰리고가 되도록 노력하겠습니다!!");
	}
</script>
</body>
</html>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>