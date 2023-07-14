<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
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
<title>수거/이용권구매</title>
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
	margin-left: 30px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="container_wr">
			<div id="con"></div>
			<script
				src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
			<div class="mypage-wrap">
				<div class="container">
					<div>
						<div class="left-div">
							<h2>신청/이용권구매</h2>
							<ul>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/menu/reqPickupGarbage">수거
										신청</a></li>
								<li class="active"><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/menu/buyTicket">이용권
										구매</a></li>
							</ul>
						</div>
					</div>
					<div class="right-div">
						<h3>이용권 구매</h3>

						<div class="new-mypage-form-box">
							<form name="buyTicketFrm" action="<%= request.getContextPath() %>/menu/buyTicket" method="post">
								<table class="mypage-table">
									<tbody>
										<tr>
											<th>아이디</th>
											<td><%= memberId %></td>
										</tr>
										<tr>
											<th>입금은행</th>
											<td><%= name %></td>
										</tr>
			
										<tr>
											<th>이용권구매</th>
											<td>
												<div class="selectbox-box">
													<div class="selectbox-label"></div>
												</div>
												<div class="selectbox-layer layer_width_base">
													<div class="selectbox-list"></div>
												</div> <span class="drop"></span>
											</td>
										</tr>
										<tr>
											<th>결제금액</th>
											<td><label for="ticket"></label> <select
												name="ticket" id="ticket">
													<option value="1" selected>1</option>
													<option value="3">3</option>
													<option value="5">5</option>
													<option value="10">10</option>
											</select> <a>회권</a> <br> <label for="price">결제금액: </label> <span
												id="selectedPrice"></span></td>
										</tr>



									</tbody>
								</table>
								<div class="f_btn">
								
    								<input type="hidden" name="memberId" id="memberId" value="<%= memberId %>">
   									<input type="hidden" name="ticId" id="ticId" value="${ticId}">
									<button type="submit" class="btn">구매하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div id="paymentForm" style="display: none;">
		<h2>무통장 입금 안내</h2>
		<p>아래 계좌로 결제금액을 입금해주세요.</p>
		<p>
			은행: <span id="bankName"></span>
		</p>
		<p>
			계좌번호: <span id="accountNumber"></span>
		</p>
		<p>
			결제금액: <span id="amount"></span>
		</p>
		<p>
			입금기한: <span id="depoLine"></span>
		</p>
	</div>
			
			
			
			
			
			
</body>
</html>
<script>
    const priceInfo = {
        1: 5000,
        3: 15000,
        5: 23900,
        10: 46900
    };
    
    const ticketSelect = document.getElementById("ticket");
    const priceLabel = document.getElementById("selectedPrice");
    const paymentForm = document.getElementById("paymentForm");
    const mypageTable = document.querySelector(".mypage-table");
    
    
    
    
    
	
    
    ticketSelect.addEventListener("change", function() {
        const selectedTicket = parseInt(ticketSelect.value);
        const price = priceInfo[selectedTicket];
        priceLabel.textContent = price + "원";
    });

    const initialTicket = parseInt(ticketSelect.value);
    const initialPrice = priceInfo[initialTicket];
    priceLabel.textContent = initialPrice + "원";

    document.buyTicketFrm.onsubmit = function(e) {
       
        
        const ticId = "tic" + ticket.value;
        document.getElementById("ticId").value = ticId
        
        console.log(ticId);
        // mypage-table 안내 표시
        const selectedTicket = parseInt(ticketSelect.value);
        const selectedPrice = priceInfo[selectedTicket];
        const bankName = "입금은행 이름";
        const accountNumber = "계좌번호";
        const depoLine = "입금기한";
        
        mypageTable.innerHTML = `
            <tr>
                <th colspan="2">무통장 입금 안내</th>
            </tr>
            <tr>
                <td colspan="2">
                    <p>아래 계좌로 결제금액을 입금해주세요.</p>
                    <p>은행: <span id="bankName">${bankName}</span></p>
                    <p>계좌번호: <span id="accountNumber">${accountNumber}</span></p>
                    <p>결제금액: <span id="amount">${selectedPrice}원</span></p>
                    <p>입금기한: <span id="depoLine">${depoLine}</span></p>
                </td>
            </tr>
        `;
        
        paymentForm.style.display = "none";
        
        /* e.preventDefault(); */
    };
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>