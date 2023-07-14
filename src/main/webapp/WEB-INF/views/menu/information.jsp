<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쓰리고 | 이용방법</title>
    <style>
h2 { display: block; font-size: 1.5em; margin-block-start: 0.83em; margin-block-end: 0.83em; 
  		margin-inline-start: 21%; margin-inline-end: 0px; font-weight: bold; }
strong { letter-spacing: -1px; font-weight: bolder; font-size: 1.3rem !important; }
span { color: #49B466; }
p { letter-spacing: -1px; padding-top: 6px; font-size: 1rem !important; word-break: keep-all; margin-top: 0; margin: 0; }
.text-box { padding: 1.5rem; }
.info-bg-box1, .info-bg-box2, .info-bg-box3, .info-bg-box4, .info-bg-box5, .info-bg-box6 {
				    box-shadow: 1px 2px 8px #c0c0c04d; border-radius: 20px; height: 470px; background-size: cover; 
				    background-repeat: no-repeat; width: 500px; margin-bottom: 5%; margin-left : 50px; }
.container { height: auto; position: relative; width: 100%; padding-right: var(--bs-gutter-x,.75rem); 
					 padding-left: var(--bs-gutter-x,.75rem); margin-right: auto; margin-left: auto; }
.info-boxes { --bs-gutter-x: 1.5rem; --bs-gutter-y: 0 display: flex; flex-wrap: wrap; margin-top: calc(-1 * var(--bs-gutter-y)); 
					  margin-right: 20%; margin-left: 20%; justify-content: space-between!important; }
.info-box{ display : flex; flex-direction: row; align-items: center; justify-content: center; }
/** 박스 이미지 사이즈, 위치 조절*/
.info-bg-box1 { background-image: url(../images/information1.png); background-size: 70%; background-position: center bottom; }
.info-bg-box2 { background-image: url(../images/information2.png); background-size: 80%; background-position: center bottom; }
.info-bg-box3 { background-image: url(../images/information3.png); background-size: 65%; background-position: center bottom; }
.info-bg-box4 { background-image: url(../images/information4.png); background-size: 80%; background-position: center bottom; }
.info-bg-box5 { background-image: url(../images/information5.png); background-size: 90%; background-position: left bottom; }
.container {padding-top: 3rem; padding-bottom: 6rem;}
    </style>
</head>
<body>
<div class="container">
    <div class="top-div">
        <h2>쓰리고 이용안내</h2>
    </div>

    <div class="info-boxes">
        <div class="info-box">
            <div class="info-bg-box1">
                <div class="text-box">
                    <strong>
                        <span>01.</span>
                        회원가입
                    </strong>
                    <p>쓰리고 홈페이지 상단 회원가입 페이지에서 정보를 입력 후<br> 회원가입을 완료해주세요.</p>
                </div>
            </div>
            <div class="info-bg-box2">
                <div class="text-box">
                    <strong>
                        <span>02.</span>
                        수거서비스 신청
                    </strong>
                    <p>이용하실 횟수를 선택하고 수거를 신청하세요.</p>
                </div>
            </div>
        </div>
        <div class="info-box">
            <div class="info-bg-box3">
                <div class="text-box">
                    <strong>
                        <span>03.</span>
                        쓰레기 모으기
                    </strong>
                    <p>쓰레기봉투에 별도의 분류 없이 담아주시면 쓰리고가 재분류합니다.<br>
                    음식물쓰레기는 따로 담아주세요.
                    </p>
                </div>
            </div>
        
            <div class="info-bg-box4">
                <div class="text-box">
                    <strong>
                        <span>04.</span>
                        쓰레기봉투 현관문 앞 배출
                    </strong>
                    <p>아파트별 배출요일을 약속하여 편의를 제공해드립니다.</p>
                </div>
            </div>
        </div>
        <div class="info-box">

            <div class="info-bg-box5">
                <div class="text-box">
                    <strong>
                        <span>05.</span>
                        수거완료
                    </strong>
                    <p>수거 후 수거완료 내용을 알려드립니다.</p>
                </div>
            </div>
        
            <div class="info-bg-box6">
                <div class="text-box">
                	<br><br>
                    <strong>
                        <span>●</span>
                        배출 시 주의사항<br>
                    </strong>
                    <br>
                    <p><span>01. </span>종이박스류와 스티로폼은 수거주머니 옆에 놓아주시면 수거됩니다.</p><br>
                    <p><span>02. </span>쓰레기봉투에 쓰레기가 초과되지 않고 봉투가 묶여있는 상태여야 수거가 됩니다.</p><br>
                    <p><span>03. </span>쓰레기봉투 외부에는 박스류, 스티로폼을 제외한 다른 쓰레기는 수거가 불가합니다.</p><br>
                    <p><span>04. </span>쓰레기봉투에 담기지 않는 대형 폐기물과 스티커 부착이 필요한 지정 폐기물은 수거되지 않습니다.</p><br>
                </div>
            </div>
        </div>  
    </div>
</div>
</body>
</html>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>