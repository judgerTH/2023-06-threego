<%@page import="com.threego.app.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />
<title>아이디 찾기</title>
<%
	// Member member = (Member)request.getAttribute("member");

%>
</head>
<body>
	<div class="search-wrapper">
        <div class="search-subwrapper">
            <h2>아이디 찾기</h2>
            <p>아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</p>
            <form name = "serchIdFrm" id = "serchIdFrm">
            <p id = "confirm-id"></p>
            <input type="text" class= "search-input" name="email" id="email" placeholder="등록하신 이메일">
            <button type="submit" id="btn-searchId">찾기</button>
            </form>
        </div>
    </div>

</body>
<script>

document.serchIdFrm.onsubmit = (e) => {
	
	const frmData = new FormData(e.target);
	
	 $.ajax({
	        url : "<%= request.getContextPath() %>/member/MemberSearchId",
	        data : frmData,
	        method : "POST",
	        dataType : "json",
	        processData : false,
	        contentType : false,
	        success(responseData){
	            
	        	const pTag = document.querySelector("#confirm-id");
	
	        	if(responseData != null){
	        		const {id, email} = responseData;
	        		
	        		pTag.innerHTML = `조회하신 아이디는 <span id = "searched-id">\${id}</span>입니다.`;
	        		
	        	} else {
	        		pTag.innerHTML = `등록된 이메일이 아닙니다. 다시 확인해주시길 바랍니다.`;
	        	}
	            
	        },
	        complete(){
	        	e.target.reset();
	        	
	        }
				
	    });
	e.preventDefault();
	
	
}

</script>
</html>