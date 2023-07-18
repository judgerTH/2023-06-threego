<%@page import="com.threego.app.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
Board board = (Board) request.getAttribute("board");
%>
<style>
.left-div ul li {
	display: inline-block;
	margin-right: 10px;
}

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

#tbl-board-view input[type="text"], #tbl-board-view textarea {
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
	margin-top: 20px;
	width: 1200px;
	border-collapse: collapse;
	margin: 0 auto;
}

input #writer {
	width: 30%;
	font-size: 20px;
}

#tbl-board-view textarea {
	width: 900px;
	height: 250px;
	resize: none;
}

#inquiryTag {
	margin-top: 130px;
	margin-bottom: 35px;
	margin-left: 60px;
	font-size: 24px;
	font-weight: bold;
}

#btn-add,#btn-add2,#btn-add3 {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-bottom: 20px;
	float: right;
	margin-top: 20px;
	border-radius: 3px;
	margin-left:5px; 
}

li {
	list-style: none;
}
</style>
<body>
	<div class="left-div">
		<h2>고객센터</h2>
		<ul>
			<li><a class="active" aria-current="page" href="">공지사항</a></li>
			<li><a class="active" id="active1" aria-current="page"
				href="<%=request.getContextPath()%>/board/useInquiryList">이용문의</a></li>
		</ul>
	</div>
	<section id="board-container">
		<div id="inquiryTag">문의 사항 수정</div>
		<div id="CreateFrmtag">
		<form name= "useInquiryUpdateFrm"  >
		<input type="hidden" name="no" id="no" value="<%=board.getBoardNo()%>">
			<table id="tbl-board-view">
				<tr>
					<th>글 번호</th>
					<td><%=board.getBoardNo()%></td>
					
				</tr>
				<tr>
					<th>제 목</th>
					
					<td><input type="text" name="title" id="title" value="<%=board.getBoardTitle()%>"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=board.getBoardWriter()%></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea name="boardContent" style="resize: none;"
							rows="10"><%=board.getBoardContent()%></textarea></td>
				</tr>
			</table>
			<div class="bottom-div">
				<ul>
					
					<li><a class="active" id="btn-add" aria-current="page"
						href="#" onclick="history.go(-1);">취소</a></li>
					<li><a class="active" id="btn-add3" aria-current="page"
						href="#" onclick="useInquiryDelete();">삭제</a></li>	
					<li><a class="active" id="btn-add2" aria-current="page"
						href="#" onclick="useInquiryUpdate();">수정</a></li>
				</ul>

		   </div>
		</form>
		</div>
	</section>
</body>
<script>
let xhr;
const useInquiryUpdate=()=>{
	 const form = document.useInquiryUpdateFrm;
	 const xhr = new XMLHttpRequest();
	  xhr.open("POST", "<%= request.getContextPath() %>/board/useInquiryUpdate");
	  
	  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	  xhr.onload = function() {
		  if (xhr.status === 200) {
			  alert("성공적으로 수정되었습니다.") 
		    const boardNo = xhr.responseText;// 서버로부터 받은 게시물 번호
		    console.log(boardNo);
		    window.location.href = "<%= request.getContextPath() %>/board/useInquiryDetail?no=" + boardNo;
		  } else {
		    // 에러 처리
		  }
		};

	  const title = form.title.value;
	  const no = form.no.value;
	  const boardContent = form.boardContent.value;
	  xhr.send(`title=\${title}&no=\${no}&boardContent=\${boardContent}`);
	};
	
	const useInquiryDelete=()=>{
		
		if(confirm("정말 삭제하시겠습니까?")) {
		
		 const form = document.useInquiryUpdateFrm;
		 const xhr = new XMLHttpRequest();
		  xhr.open("POST", "<%= request.getContextPath() %>/board/useInquiryDelete");
		  
		  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		  xhr.onload = function() {
			  if (xhr.status === 200) {
				alert("성공적으로 삭제되었습니다.")  
			    window.location.href = "<%= request.getContextPath() %>/board/useInquiryList";
			  } else {
			    // 에러 처리
			  }
			};

		  const title = form.title.value;
		  const no = form.no.value;
		  const boardContent = form.boardContent.value;
		  xhr.send(`no=\${no}`);
			}
		};	
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>