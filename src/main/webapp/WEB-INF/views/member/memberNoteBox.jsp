<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    <%
    	String memberId = loginMember.getId();
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쓰리고 | 회원정보수정</title>
    <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
     <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member_page.css" />
</head>
<body>
        <div id="container">
    <div class="mypage-wrap">
        <div class="container">
            <div>
                <div class="left-div">
                <h2>마이페이지</h2>
                    <ul>
                        <li><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/myPage">회원정보 수정</a></li>
								<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.U){ %>
                       			<li><a class="" aria-current="page"
                       				href="<%= request.getContextPath() %>/member/paymentList?memberId=<%= memberId %>">결제정보</a></li>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/member/requestList?memberId=<%= memberId %>">수거신청내역</a></li>
								<% } else if(loginMember != null && loginMember.getMemberRole() == MemberRole.R) { %>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/rider/requestCollectionList">수거
										리스트</a></li>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/rider/riderCollectionListCheck">나의
										수거 목록 조회</a></li>
								<% } %>
                        		<li class="active"><a class="" aria-current="page" href="<%= request.getContextPath() %>/member/notebox">📑받은 메시지</a></li>
                    </ul>
                </div>
            </div>
            </div>
            <div class="right-div">
                <h3>받은 메시지</h3>
                <table class="mypage-table">
                    <tbody>
                        <tr>
                            <td>NO</td>
                            <td>제목</td>
                            <td>등록일</td>
                            <td>상태</td>
                        </tr>
                        <tr>
                        	<td colspan="7" class="empty_table">받은 메시지가 없습니다.</td>
                        </tr>           
                     </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>