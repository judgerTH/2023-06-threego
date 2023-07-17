<%@page import="com.threego.app.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
Board board = (Board) request.getAttribute("board");
%>
<body>
	<section id="board-container">
		<h2>문의 사항</h2>
		<table id="tbl-board-view">
			<tr>
				<th>글번호</th>
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
				<td><textarea readonly style="resize: none;" rows="10"><%=board.getBoardContent()%></textarea>
				</td>
			</tr>
		</table>
	</section>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>