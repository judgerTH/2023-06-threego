package com.threego.app.request.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.request.model.service.RequestService;

@WebServlet("/request/reqGarbagePickup")
public class ReqGarbagePickupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final RequestService requestService = new RequestService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 파라미터 값 가져오기
        String id = request.getParameter("id");
        String address = request.getParameter("address");
        String photo = request.getParameter("photo");
        String post = request.getParameter("post");
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
        
        System.out.println("id - " + id + " location - " + location + " adress - " + address + " photo - " + photo + " post - " +post);
        // 요청 테이블에 데이터 추가
        boolean result = requestService.reqGarbagePickup(id, location, post, address, photo);

        // 응답 처리
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // 응답 데이터 생성
        String jsonResponse;
        if (result) {
            // 성공적으로 데이터가 추가된 경우
            jsonResponse = "{\"success\": true, \"message\": \"요청이 성공적으로 저장되었습니다.\"}";
        } else {
            // 데이터 추가 실패한 경우
            jsonResponse = "{\"success\": false, \"message\": \"요청 저장에 실패했습니다.\"}";
        }

        // 응답 전송
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}
