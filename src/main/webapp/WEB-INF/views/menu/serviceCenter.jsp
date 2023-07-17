<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쓰리고 | 고객센터</title>
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
	color: #363636;
	font-size: large;
	font-weight: bolder;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-left: 190px;
}

.right-div {
	flex: 1;
	margin-left: 590px;
	flex-direction: column;
	display: flex;
	flex-wrap: wrap;
	width: 1200px;
}

.con {
	float: left;
}

h2 {
	margin-left: 60px;
}

tbody, td, tfoot, th, thead, tr {
	border-color: inherit;
	border-style: solid;
	border-width: 0;
}

input {
	border: 1px solid #d0d3db;
	background: #fff;
	color: #000;
	vertical-align: middle;
	border-radius: 3px;
	padding: 5px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.119);
}

span {
	color: #248739;
}
</style>
</head>
<body>
	<div class="left-div">
		<h2>고객센터</h2>
		<ul>
			<li class="active"><a class="" aria-current="page" href="">공지사항</a></li>
			<li><a class="active" aria-current="page"
				href="<%=request.getContextPath()%>/board/useInquiryList">이용문의</a></li>
		</ul>
	</div>
	
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>