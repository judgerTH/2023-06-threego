package com.threego.app.rider.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.threego.app.common.HelloMvcFileRenamePolicy;
import com.threego.app.rider.model.service.RiderService;
import com.threego.app.rider.model.vo.Rider;

/**
 * Servlet implementation class RiderApplicationServlet
 */
@WebServlet("/rider/riderApplication")
public class RiderApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final RiderService riderService = new RiderService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				ServletContext application = getServletContext();
				String saveDirectory = application.getRealPath("/upload/file");
				// 파일하나당 최대크기 10MB 
				int maxPostSize = 1024 * 1024 * 10; 
				// 인코딩
				String encoding = "utf-8";
				
				// 파일명 재지정 정책객체
				// 한글.txt --> 20230629_160430123_999.txt
				FileRenamePolicy policy = new HelloMvcFileRenamePolicy();
				
				MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
				
				// 1. 사용자 입력값 처리
				String id = multiReq.getParameter("id");
				
				String location = multiReq.getParameter("location");

				
				String filename = multiReq.getFilesystemName("upFile");
				// 2. 업무로직
				Rider rider = new Rider(id, location, null, null, null, null, null, filename);
				int result = riderService.insertRider(rider);
				
				
			}

		}
