package com.bonggeuda.sugbag.adminNotice.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.adminNotice.dto.AdminNoticeDTO;
import com.bonggeuda.sugbag.adminNotice.service.AdminNoticeService;


/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/notice/insert")
public class NoticeInsertServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path="";

		path="/WEB-INF/views/admin/notice/noticeWrite.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminNoticeService noticeInfoService = new AdminNoticeService();
		AdminNoticeDTO  dto = new AdminNoticeDTO();
		
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
      
		dto.setContent(content);
		dto.setWriteDate(new Date(System.currentTimeMillis()));
		dto.setTitle(title);
		dto.setWriter(writer);

		int insertNotice= noticeInfoService.insertNotice(dto);
		
		String path="";
		if(insertNotice > 0 ) {
			path= "/bonggeuda/notice/list";
			response.sendRedirect(path);
		} 
	}

}
