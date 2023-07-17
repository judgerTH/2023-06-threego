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
	margin-left: 60px;
}

tbody, td, tfoot, th, thead, tr {
	border-color: inherit;
	border-style: solid;
	border-width: 0;
}
#active1{
background-color: #49B466;
}
section#board-container{width:600px; margin:0 auto; text-align:center;}
section#board-container h2{margin:10px 0;}
table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 

/*글쓰기버튼*/
input#btn-add{float:right; margin: 0 0 15px;}

/*페이지바*/
div#pagebar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3); }
div#pagebar span.cPage{color: #0066ff; margin-right: 5px;}
div#pagebar a{margin-right: 5px;}

/*게시글 작성/상세보기 테이블*/
table#tbl-board-view {
	width:500px; 
	margin:0 auto; 
	border:1px solid black; 
	border-collapse:collapse;  
}
table#tbl-board-view th {
	width: 150px; 
	border:1px solid; 
	padding: 10px 0; 
	text-align:center; 
} 
table#tbl-board-view td {
	border:1px solid; 
	padding: 5px 0 5px 15px; 
	text-align:left;
}
table#tbl-board-view img {width: 16px;}
table#tbl-board-view input[type=file] {margin: 3px 0;}

/*게시글 수정하기*/
span#fname{
    position: absolute;
    left: 92px;
    top: 10px;
    width: 255px;
    font-size: 14px;
    background: #f5f5f5;
}
#del_file+label{font-size:.8em; position:relative; top:-3px;}

/*댓글등록버튼*/
div.comment-container button#btn-comment-enroll1 {width:60px; height:50px; color:white; background:#3300ff; position:relative; top:-20px;}

/*댓글테이블*/
table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse;} 
table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
table#tbl-comment button.btn-reply{display:none;}
table#tbl-comment tr:hover {background:lightgray;}
table#tbl-comment tr:hover button.btn-reply{display:inline;}
table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
table#tbl-comment sub.comment-date {color:tomato; font-size:10px}

table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}

/*답글관련*/
table#tbl-comment textarea{margin: 4px 0 0 0;}
table#tbl-comment button.btn-comment-enroll2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}

/* 삭제버튼관련 */
table#tbl-comment button.btn-delete{background:red; color:white; display:none;}
table#tbl-comment tr:hover button.btn-delete{display:inline;}

</style>
</head>
<body>
	<div class="left-div">
		<h2>고객센터</h2>
		<ul>
			<li class="active"><a class="" aria-current="page" href="">공지사항</a></li>
			<li><a class="active" id="active1" aria-current="page"
				href="<%=request.getContextPath()%>/board/useInquiryList">이용문의</a></li>
		</ul>
	</div>
	<section id="board-container">
		<input type="button" id="btn-add" value="글쓰기" onclick="" />
		<table id="tbl-board">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>첨부파일</th>
					<%--첨부파일이 있는 경우 /images/file.png 표시 width:16px --%>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="6">조회된 게시글이 없습니다.</td>
				</tr>
			</tbody>
		</table>
	</section>
	<div id='pagebar'></div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>