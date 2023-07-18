package com.threego.app.notification.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;

import com.google.gson.Gson;
import com.threego.app.ws.HelloWebSocket;
import com.threego.app.ws.MessageType;
import com.threego.app.rider.model.vo.Rider;

/**
 * 
 * 알림 요청이 있을때마다 
 * - 1. db notification테이블 저장 (생략)
 * - 2. HelloWebSocket.clientMap에서 해당 사용자를 찾아서 실시간 알림처리
 *
 * honggd 게시글 작성 - sinsa 해당게시글에 댓글 작성 - honggd 게시글댓글 알림 
 */
public class NotificationService {

	/**
	 * 1. db저장
	 * 2. 실시간알림
	 * 
	 * @param board
	 * @return
	 */
	public int notifyRequestRiderApprovement(Rider rider) {
		// 1. 저장
//		int result = notificationDao.insertNotification(conn, notification);
		// no, messageType, receiver, createdAt, message, checked
		
		// 2.실시간 알림
		// WebSocket Session 가져오기
		Session wsSession = HelloWebSocket.clientMap.get(rider.getRiderId());
		if(wsSession != null) {
			Basic basic = wsSession.getBasicRemote();
			try {
				Map<String, Object> payload = new HashMap<>();
				payload.put("messageType", MessageType.RIDER_APPROVEMENT);
				payload.put("receiver", rider.getRiderId());
				payload.put("createdAt", System.currentTimeMillis());
				payload.put("message", "라이더 신청이 완료되었습니다. 메세지함을 확인해주세요.");
				basic.sendText(new Gson().toJson(payload));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	public int notifyRequestRiderRefusal(Rider rider) {
		// 1. 저장
//		int result = notificationDao.insertNotification(conn, notification);
		// no, messageType, receiver, createdAt, message, checked
		
		// 2.실시간 알림
		// WebSocket Session 가져오기
		Session wsSession = HelloWebSocket.clientMap.get(rider.getRiderId());
		if(wsSession != null) {
			Basic basic = wsSession.getBasicRemote();
			try {
				Map<String, Object> payload = new HashMap<>();
				payload.put("messageType", MessageType.RIDER_REFUSAL);
				payload.put("receiver", rider.getRiderId());
				payload.put("createdAt", System.currentTimeMillis());
				payload.put("message", "라이더 신청이 반려되었습니다. 메세지함을 확인해주세요.");
				basic.sendText(new Gson().toJson(payload));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public int notifyWarningCatuionByRiderId(String requestRider) {
		// 1. 저장
//		int result = notificationDao.insertNotification(conn, notification);
		// no, messageType, receiver, createdAt, message, checked
		
		// 2.실시간 알림
		// WebSocket Session 가져오기
		Session wsSession = HelloWebSocket.clientMap.get(requestRider);
		if(wsSession != null) {
			Basic basic = wsSession.getBasicRemote();
			try {
				Map<String, Object> payload = new HashMap<>();
				payload.put("messageType", MessageType.WARNING_CAUTION_BY_RIDER);
				payload.put("receiver", requestRider);
				payload.put("createdAt", System.currentTimeMillis());
				payload.put("message", "신고 접수가 확인되었습니다. 메세지함을 확인해주세요.");
				basic.sendText(new Gson().toJson(payload));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public int notifyWarningCatuionByrequestWriter(String requestWriter) {
		// 1. 저장
//		int result = notificationDao.insertNotification(conn, notification);
		// no, messageType, receiver, createdAt, message, checked
		
		// 2.실시간 알림
		// WebSocket Session 가져오기
		Session wsSession = HelloWebSocket.clientMap.get(requestWriter);
		if(wsSession != null) {
			Basic basic = wsSession.getBasicRemote();
			try {
				Map<String, Object> payload = new HashMap<>();
				payload.put("messageType", MessageType.WARNING_CAUTION_BY_WRITER);
				payload.put("receiver", requestWriter);
				payload.put("createdAt", System.currentTimeMillis());
				payload.put("message", "신고 접수가 확인되었습니다. 메세지함을 확인해주세요.");
				basic.sendText(new Gson().toJson(payload));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public int notifyCancelRequest(String _writer) {
		// 1. 저장
//		int result = notificationDao.insertNotification(conn, notification);
		// no, messageType, receiver, createdAt, message, checked
		
		// 2.실시간 알림
		// WebSocket Session 가져오기
		Session wsSession = HelloWebSocket.clientMap.get(_writer);
		if(wsSession != null) {
			Basic basic = wsSession.getBasicRemote();
			try {
				Map<String, Object> payload = new HashMap<>();
				payload.put("messageType", MessageType.CANCELED_REQUEST);
				payload.put("receiver", _writer);
				payload.put("createdAt", System.currentTimeMillis());
				payload.put("message", "수거요청이 취소되었습니다. 메세지함을 확인해주세요.");
				basic.sendText(new Gson().toJson(payload));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public int notifyCompleteRequest(String _writer) {
		// 1. 저장
//		int result = notificationDao.insertNotification(conn, notification);
		// no, messageType, receiver, createdAt, message, checked
		
		// 2.실시간 알림
		// WebSocket Session 가져오기
		Session wsSession = HelloWebSocket.clientMap.get(_writer);
		if(wsSession != null) {
			Basic basic = wsSession.getBasicRemote();
			try {
				Map<String, Object> payload = new HashMap<>();
				payload.put("messageType", MessageType.COMPLETE_REQUEST);
				payload.put("receiver", _writer);
				payload.put("createdAt", System.currentTimeMillis());
				payload.put("message", "수거 완료 되었습니다. 메세지함을 확인해주세요.");
				basic.sendText(new Gson().toJson(payload));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	
}


