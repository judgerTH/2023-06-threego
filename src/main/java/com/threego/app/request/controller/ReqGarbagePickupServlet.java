package com.threego.app.request.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.threego.app.common.TrashFileRenamePolicy;
import com.threego.app.payment.model.vo.Payment;
import com.threego.app.request.model.service.RequestService;

@WebServlet("/request/reqGarbagePickup")
public class ReqGarbagePickupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final RequestService requestService = new RequestService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 업로드파일 저장경로 C:\\Workspaces\\web_server_workspace\\hello-mvc\\src\\main\\webapp\\upload\\board
		ServletContext application = getServletContext();
		String saveDirectory = application.getRealPath("/upload/reqphoto");
		int maxPostSize = 1024 * 1024 * 10; // 10MB
		String encoding = "UTF-8";

		// 파일명 중복 시 자동으로 파일명을 변경하는 정책을 설정
		FileRenamePolicy policy = new TrashFileRenamePolicy();

		// MultipartRequest를 사용하여 파일 업로드 처리
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

		// 파일 업로드 후 처리할 로직 작성
		// 파일 정보는 multi 객체를 통해 얻을 수 있습니다.
		// 예를 들어, multi.getFilesystemName("파라미터명")을 사용하여 업로드된 파일의 저장된 이름을 얻을 수 있습니다.

		// 파라미터 값 가져오기
		String id = multi.getParameter("id");
		String _address = multi.getParameter("address");
		String detailAddress = multi.getParameter("detailAddress");
		String address = _address + detailAddress;

		String photo = multi.getFilesystemName("photo");
		String post = multi.getParameter("post");
		
		System.out.println(id + " "  + address + "    "+ photo +"     " + post);
		// 주소로부터 지역 구분
		String location;
		if (address.contains("서초구") || address.contains("강남구")) {
			location = "S1";
		} else if (address.contains("송파구") || address.contains("강동구")) {
			location = "S2";
		} else if (address.contains("광진구") || address.contains("성동구")) {
			location = "S3";
		} else {
			// 기본값이나 처리할 수 없는 경우의 지역 설정
			location = "Unknown";
		}
		
		// 요청 테이블에 데이터 추가
		int cntResult = requestService.countUpdate(id); // 카운트 업데이트 
		Payment uesPayment = requestService.findPayment(id); // 업데이트된 payment 조회

		if(uesPayment == null ) {
			response.setContentType("application/json; charset=utf-8");
			
			Map<String, Object> map = new HashMap<>();
			map.put("result", "실패");
			
			new Gson().toJson(map, response.getWriter());
			
		}else {
			
			boolean result = requestService.reqGarbagePickup(id, location, post, address, photo);
			
			if(uesPayment.getP_cnt() == 0) {
			int deletePayment = requestService.deletePayment(id); // 이용권을 다쓰면 delete
			};
			
			response.setContentType("application/json; charset=utf-8");
			
			Map<String, Object> map = new HashMap<>();
			map.put("result", "성공");
			map.put("uesPayment", uesPayment);
			
			new Gson().toJson(map, response.getWriter());
		}
		
		
//		if(uesPayment.getP_cnt() == 0) {
//
//			int deletePayment = requestService.deletePayment(id); // 이용권을 다쓰면 delete
//			if(uesPayment == null) {
//				
//			}else {
//				response.setContentType("application/json; charset=utf-8");
//				
//				Map<String, Object> map = new HashMap<>();
//				map.put("result", "성공");
//				map.put("uesPayment", uesPayment);
//				
//				new Gson().toJson(map, response.getWriter());
//			}
//		}
		
		
		
		// JSP 페이지로 포워딩
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/menu/buyTicket.jsp");
//		dispatcher.forward(request, response);
		
		
		
		// 응답 처리
		
		
		
		// Gson 객체 생성
//		Gson gson = new Gson();
//
//		// 응답 데이터 생성
//		String jsonResponse;
//		if (result) {
//			// 성공적으로 데이터가 추가된 경우
//			jsonResponse = "{\"success\": true, \"message\": \"요청이 성공적으로 저장되었습니다.\", \"payment\": " + gson.toJson(payment) + "}";
//		} else {
//			// 데이터 추가 실패한 경우
//			jsonResponse = "{\"success\": false, \"message\": \"요청 저장에 실패했습니다.\", \"payment\": " + gson.toJson(payment) + "}";
//		}
//
//		// 응답 전송
//		PrintWriter out = response.getWriter();
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		out.print(jsonResponse);
//		out.flush();
		
		
		
		
	}
}
