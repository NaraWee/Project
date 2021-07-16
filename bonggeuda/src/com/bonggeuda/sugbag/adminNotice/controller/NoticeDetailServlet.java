package com.bonggeuda.sugbag.adminNotice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.adminNotice.dto.AdminNoticeDTO;
import com.bonggeuda.sugbag.adminNotice.service.AdminNoticeService;


/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/notice/detail")
public class NoticeDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AdminNoticeService adminNoticeService = new AdminNoticeService();
		
		AdminNoticeDTO noticeInfo = adminNoticeService.selectNoticeDetail(request.getParameter("noticeNo"));
		
		String path = "";
		
		if(noticeInfo != null) {
			path = "/WEB-INF/views/admin/notice/noticeDetail.jsp";
			request.setAttribute("noticeInfo", noticeInfo);
			request.setAttribute("noticeNo", request.getParameter("noticeNo"));
		} 

		request.getRequestDispatcher(path).forward(request, response);
	}
}


	

