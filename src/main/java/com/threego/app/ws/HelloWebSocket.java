package com.threego.app.ws;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

@ServerEndpoint(value = "/helloWebSocket", configurator = HelloWebSocketConfigurator.class)
public class HelloWebSocket {
	
	// WebSocket 세션을 관리할 맵(멀티스레드에 사용하므로 동기화처리 필수)
	// memberId:String = websocketSession:Session
	public static Map<String, Session> clientMap = 
			Collections.synchronizedMap(new HashMap<>());
	
	@OnOpen
	public void onOpen(EndpointConfig config, Session session) {
//		System.out.println("open");
		Map<String, Object> configProperties = config.getUserProperties();
		String memberId = (String) configProperties.get("memberId");
		
		// 1. clientMap에 저장
		clientMap.put(memberId, session);
		// 2. WebSocket Session객체 properties 맵 객체에 memberId 저장 (@OnClose에서 사용)
		Map<String, Object> sessionProperties = session.getUserProperties();
		sessionProperties.put("memberId", memberId); 
		
	}
	
	@OnMessage
	public void onMessage(String message, Session session) {
		// db chatService.insertChat(chat) 시작!
		
//		System.out.println("message : " + message);
		Map<String, Object> payload = new Gson().fromJson(message, Map.class);
//		System.out.println("payload from message : " + payload);
	}
	
	@OnError
	public void onError(Throwable e) {
//		System.out.println("error");
		e.printStackTrace();
	}
	@OnClose
	public void onClose(Session session) {
//		System.out.println("close");
		Map<String, Object> sessionProperties = session.getUserProperties();
		String memberId = (String) sessionProperties.get("memberId");
		clientMap.remove(memberId); // 해당 memberId의 WebSocket Session객체 제거
		
	}

	
}
