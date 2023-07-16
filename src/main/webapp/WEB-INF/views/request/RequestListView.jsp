<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
<style>
 #requestDetail{border-collapse: collapse; margin-top : 20px;}
#requestDetail th, td{padding : 10px; border : 2px solid #d2d2d2}
#requestDetail-wrap{border : none; width : 500px;}
.btn-accept{margin : 10px 5px;border : none; padding : 5px 15px; color : white; background-color: #49B466; font-weight: bold; border-radius: 3px;}
</style>
</head>
<body>
	 <fieldset id = "requestDetail-wrap">
        <h3>접수 내역 상세</h3>
        <hr>
        <table id = "requestDetail">
            <tr>
                <th>접수번호</th>
                <td></td>
            </tr>
            <tr>
                <th>접수자</th>
                <td></td>
            </tr>
            <tr>
                <th>접수지역</th>
                <td></td>
            </tr>
            <tr>
                <th>접수일자</th>
                <td></td>
            </tr>
            <tr>
                <th>접수사진</th>
                <td></td>
            </tr>
            <tr>
                <th>접수현황</th>
                <td></td>
            </tr>
            <tr>
                <th>담당 수고미</th>
                <td></td>
            </tr>
            <tr>
                <th>처리일자</th>
                <td></td>
            </tr>
    
        </table>
    </fieldset>
</body>
</html>