/**
 * ws.js
 * 로그인한 사용자용 웹소켓 연결처리
 */
const ws = new WebSocket(`ws://${location.host}/threego/helloWebSocket`); // 서버측 endpoint 연결
console.log(location.host);


ws.addEventListener('message', (e) => {
	console.log('message : ', e);
	
	const {messageType, createdAt, message, sender} = JSON.parse(e.data);
	console.log(messageType, createdAt, message, sender);
	
	const alarmBox = document.querySelector("#alarmBox");
	
	switch(messageType) {
		
		case 'RIDER_APPROVEMENT' : 
			
			alarmBox.style.display = "inline";
			
			alarmBox.onclick = () => {
				alert(message);
				alarmBox.style.display="none";
			}
			
		break;
			
		case 'WARNING_CAUTION_BY_RIDER' : 
			
			alarmBox.style.display = "inline";
			
			alarmBox.onclick = () => {
				alert(message);
				alarmBox.style.display="none";
			}
			
		break;
		
		case 'WARNING_CAUTION_BY_WRITER' : 
			
			alarmBox.style.display = "inline";
			
			alarmBox.onclick = () => {
				alert(message);
				alarmBox.style.display="none";
			}
			
		break;
		
		case 'CANCELED_REQUEST' : 
			
			alarmBox.style.display = "inline";
			
			alarmBox.onclick = () => {
				alert(message);
				alarmBox.style.display="none";
			}
			
		break;
		
		case 'COMPLETE_REQUEST' : 
			
			alarmBox.style.display = "inline";
			
			alarmBox.onclick = () => {
				alert(message);
				alarmBox.style.display="none";
			}
			
		break;
	}
	
});

ws.addEventListener('error', (e) => {
	console.log('error : ', e);
});

ws.addEventListener('close', (e) => {
	console.log('close : ', e);
});

window.addEventListener('beforeunload', () => {
    ws.close(); // 명시적 웹소켓 닫기
});