<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
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
        font-size : 20px;
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

.con {
	float: left;
}

#center-tag {
	margin-left: 60px;
	font-size: 30px;
	font-weight: bold;
}

#inquiryTag {
	margin-top: 100px;
	margin-bottom: 10px;
	margin-left: 60px;
	font-size: 24px;
	font-weight: bold;
}

#active1 {
	background-color: #49B466;
}

#board-container {
	margin-left: 220px;
	padding: 20px;
	width: 70%;
	margin-top: 20px;
	font-size: 20px;
}

#tbl-board-view {
	width: 100%;
	border-collapse: collapse;
	margin: 0 auto;
}

#tbl-board-view th, #tbl-board-view td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

#tbl-board-view th {
	background-color: #f2f2f2;
}

#tbl-board-view #text-content, #title {
	width: 100%;
	padding: 8px;
	border-radius: 4px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}
#tbl-board-view input[type="text"],
#tbl-board-view textarea {
	font-size: 20px; 
}

#tbl-board-view input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 3px;
	cursor: pointer;
}
#CreateFrmtag {
	margin-top :20px;
	width: 1200px;
	border-collapse: collapse;
	margin : 0 auto;
}
input #writer{
width : 30%;
font-size :20px;
}
#btn-add {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-bottom: 20px;
	float : right;
	margin-top:20px;
	border-radius : 3px;
	
}
#tbl-board-view textarea {
    width: 300px; 
    height: 150px; 
    resize: none;
}

</style>
<body>
	<div class="left-div">
		<div id="center-tag">고객센터</div>
		<ul>
			<li class="active"><a class="" aria-current="page" href="<%=request.getContextPath()%>/menu/serviceCenter">공지사항</a></li>
			<li><a class="active" id="active1" aria-current="page"
				href="<%=request.getContextPath()%>/board/useInquiryList">이용문의</a></li>
		</ul>
	</div>
	<section id="board-container">

		<div id="inquiryTag">문의사항 작성</div>
		<div id="CreateFrmtag">
			<form name="boardCreateFrm"
				action="<%=request.getContextPath() %>/board/useInquiryCreate"
				method="post">
				<table id="tbl-board-view">
					<tr>
						<th>제 목</th>
						<td><input type="text" name="title" id="title" required></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer" id="writer"
							value="<%= loginMember.getId() %>" readonly /></td>
					</tr>
					<tr>
						<th>내 용</th>
						<td><textarea rows="5" cols="40" name="boardContent" id="text-content"></textarea></td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" id="btn-add" value="등록하기"></th>
					</tr>
				</table>
			</form>
		</div>
	</section>
</body>
<script>
// boardCreateFrm 유효성 검사
document.boardCreateFrm.onsubmit = (e) => {
	const frm = e.target;
	const title = e.target.title;
	const content = e.target.content;

	// 제목을 작성하지 않은 경우 폼 제출할 수 없음.
	if (!/^.+$/.test(title.value)) {
		alert("제목을 작성해주세요.");
		return false;
	}

	// 내용을 작성하지 않은 경우 폼 제출할 수 없음.
	if (!/^(.|\n)+$/.test(content.value)) {
		alert("내용을 작성해주세요.");
		return false;
	}

	return true;
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
