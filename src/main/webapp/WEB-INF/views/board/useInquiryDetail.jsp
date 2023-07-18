<%@page import="com.threego.app.board.model.vo.BoardComment"%>
<%@page import="java.util.List"%>
<%@page import="com.threego.app.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
Board board = (Board) request.getAttribute("board");
List<BoardComment> boardComments = (List<BoardComment>) request.getAttribute("boardComments");
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
	height: 200px;
	resize: none;
}

#inquiryTag {
	margin-top: 130px;
	margin-bottom: 35px;
	margin-left: 60px;
	font-size: 24px;
	font-weight: bold;
}

#btn-add,#btn-add2 {
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
			<li><a class="active" aria-current="page" href="<%=request.getContextPath()%>/menu/serviceCenter">공지사항</a></li>
			<li><a class="active" id="active1" aria-current="page"
				href="<%=request.getContextPath()%>/board/useInquiryList">이용문의</a></li>
		</ul>
	</div>
	<section id="board-container">
		<div id="inquiryTag">문의 사항</div>
		<div id="CreateFrmtag">
			<table id="tbl-board-view">
				<tr>
					<th>글 번호</th>
					<td><%=board.getBoardNo()%></td>
				</tr>
				<tr>
					<th>제 목</th>
					<td><%=board.getBoardTitle()%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=board.getBoardWriter()%></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea disabled readonly style="resize: none;"
							rows="10"><%=board.getBoardContent()%></textarea></td>
				</tr>
				<tr>
					<th>답변 작성</th>
					<td>
						<form
							action="<%=request.getContextPath()%>/board/CommentCreate" 
							method="post" 
							name="boardCommentFrm">
			                <input type="hidden" name="boardNo" value="<%= board.getBoardNo() %>" />
			                <input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getId() : "" %>" />
			                <input type="hidden" name="commentLevel" value="1" />
			                <input type="hidden" name="commentRef" value="0" />    
							<textarea name="content" cols="10" rows="1" style="height: 100px"></textarea>
			                <button type="submit" id="btn-comment-enroll">등록</button>
			            </form>
					</td>
				</tr>
				<tr>
					<th>댓글</th>
					<td><%
					if(boardComments != null && !boardComments.isEmpty()) {
						for(BoardComment bc : boardComments) {
					%>
					<sub class=comment-writer><%= bc.getC_writer() %></sub>
					<sub class=comment-date><%= bc.getC_reg_date() %></sub>
					<br />
					<%= bc.getC_content() %>
					<br>
					<%  } 
					} %>
					</td>
				</tr>
			</table>
			<div class="bottom-div">
				<ul>
					<li><a class="active" id="btn-add" aria-current="page"
						href="<%=request.getContextPath()%>/board/useInquiryList">목록</a>
					<li><a class="active" id="btn-add2" aria-current="page"
						href="<%=request.getContextPath()%>/board/useInquiryUpdate?no=<%=board.getBoardNo()%>">수정</a></li>
				</ul>

			</div>

		</div>
	</section>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>