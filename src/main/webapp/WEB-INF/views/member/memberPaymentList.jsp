<%@page import="com.threego.app.ticket.model.vo.TicketPayment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    <% 
   		 String memberId = loginMember.getId();
    	List<TicketPayment> requestList = (List<TicketPayment>) request.getAttribute("paymentList");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
                        <li class="active"><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/paymentList?memberId=<%= memberId %>">결제정보</a></li>
                        <li><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/requestList?memberId=<%= memberId %>">수거신청목록</a></li>
                        <li><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/notebox">📑받은 메시지</a></li>
                    </ul>        
                </div>
            </div>
            </div>
            <div class="right-div">
                <h3>결제정보</h3>
                <table class="mypage-table">
                    <tbody>
                        <tr>
                        	<td>NO</td>
                            <td>이용권명</td>
                            <td>결제금액</td>
                            <td>결제일</td>
                            <td>잔여 이용권</td>
                        </tr>
                        <tr>
                   		<% if(requestList.isEmpty() || requestList == null) { %>
                        	<td colspan="7" class="empty_table">신청 내역이 없습니다.</td>
                        </tr>
                        <% } else {
                        			for(TicketPayment reqList : requestList) {	 %>
                        <tr>
                        <td><%= reqList.getNo() %></td>
                        <td><%= reqList.getTicName()%></td>
                        <td><%= reqList.getTicPrice() %></td>
                        <td><%= reqList.getpDate() %></td>
                        <td><%= reqList.getpCnt() %></td>
                        <% 		}
                        		}
                       	%>
                        </tr>           
                     </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>