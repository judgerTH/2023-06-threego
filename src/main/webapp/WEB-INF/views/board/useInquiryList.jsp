<%@page import="com.threego.app.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
List<Board> boards = (List<Board>) request.getAttribute("boards");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쓰리고 | 고객센터</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
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
	display: flex;
	margin-left : 20px;
}

.left-div ul li {
	margin-right: 10px;
}

.left-div ul a {
	display: inline-block;
	width: 200px;
	border-radius: 15px;
	background-color: #e9e9e9;
	text-align: center;
	line-height: 30px;
	text-decoration: none;
	color: #000000;
	font-size: 20px;
}

.left-div ul a:hover {
	background-color: #49B466;
	color: white;
}

.left-div ul .active a {
	background-color: #00000;
	color: #000000;
}

.left-div {
	display: flex;
	flex-direction: column;
	align-items: left;
	margin-left: 180px;
	width: 200px;
	float: left;
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

.con {
	float: left;
}

h2 {
	margin-left: 65px;
	font-size : 30px;
}

tbody, td, tfoot, th, thead, tr {
	border-color: inherit;
	border-style: solid;
	border-width: 0;
}

#active1 {
	background-color: #49B466;
}

#board-container {
	margin-left: 220px;
	padding: 20px;
	width: 70%;
	height : 700px;
	margin-top: 20px;
	font-size: 20px;
}

#btnadd {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 17px;
	margin-bottom: 20px;
	float: right;
	margin-top: 20px;
	border-radius: 5px;
	 font-family: 'GmarketSansMedium';
}

#tbl-board {
	width: 100%;
	border-collapse: collapse;
	margin: auto 0;
}

#tbl-board th, #tbl-board td {
	padding: 8px;
	text-align: center;;
	border-bottom: 1px solid #ddd;
}

#tbl-board th {
	background-color: #f2f2f2;
}

.left-div ul li {
	display: inline-block;
	margin-right: 10px;
}

div#pagebar {
	margin-top: 10px;
	text-align: center;
}

div#pagebar {
	color: #0066ff;
	margin-right: 5px;
}

div#pagebar {
	margin-right: 5px;
}
</style>
</head>
<body>
	<div class="left-div">
		<h2>고객센터</h2>
		<ul>
			<li><a class="active"  aria-current="page"
				href="<%=request.getContextPath()%>/menu/serviceCenter">공지사항</a></li>
			<li><a class="active" id="active1" aria-current="page"
				href="<%=request.getContextPath()%>/board/useInquiryList">이용문의</a></li>
		</ul>
	</div>
	<section id="board-container">
		<div id="tbl-boardWarpper">
			<table id="tbl-board">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>

					<%
					if (boards != null && !boards.isEmpty()) {
						for (Board board : boards) {
					%>
					<%
					if (loginMember == null) {
					%>
					<tr>
						<td><%=board.getBoardNo()%></td>
						<td><%=board.getBoardTitle()%><img
							src="<%=request.getContextPath()%>/images/secret.png" alt=""
							style="width: 16px;" /></td>
						<td><%=board.getBoardWriter()%></td>
						<td><%=board.getBoardRegDate()%></td>
					</tr>
					<%
					} else {
					%>
					<%
					if (board.getBoardWriter().equals(loginMember.getId()) || loginMember.getMemberRole() == MemberRole.A) {
					%>
					<tr>
						<td><%=board.getBoardNo()%></td>
						<td><a
							href="<%=request.getContextPath()%>/board/useInquiryDetail?no=<%=board.getBoardNo()%>">
								<%=board.getBoardTitle()%> <img
								src="<%=request.getContextPath()%>/images/secret.png" alt=""
								style="width: 16px;" />
						</a></td>
						<td><%=board.getBoardWriter()%></td>
						<td><%=board.getBoardRegDate()%></td>
					</tr>
					<%
					} else {
					%>
					<tr>
						<td><%=board.getBoardNo()%></td>
						<td><a href="#" onclick="notRead();"> <%=board.getBoardTitle()%></a>
							<img src="<%=request.getContextPath()%>/images/secret.png" alt=""
							style="width: 16px;" /></td>
						<td><%=board.getBoardWriter()%></td>
						<td><%=board.getBoardRegDate()%></td>

						<%
						}
						%>

					</tr>

					<%
					}
					}
					} else {
					%>
					<tr>
						<td colspan="4">조회된 게시글이 없습니다.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<input type="button" id="btnadd" value="문의하기" />

	</section>
	<div id="pagebar">
		<%=request.getAttribute("pagebar")%>
	</div>
</body>
<script>
const notRead =()=>{
	alert("본인글만 조회가 가능합니다.");
}

btnadd.onclick=()=>{
	<%if (loginMember == null) {%>
	alert('로그인 후 이용가능합니다.'); return false ; <%}%>
	location.href = '<%=request.getContextPath()%>/board/useInquiryCreate';
}
</script>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
