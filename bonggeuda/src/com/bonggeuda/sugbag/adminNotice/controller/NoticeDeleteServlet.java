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
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/notice/delete")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminNoticeService deleteNotice = new AdminNoticeService();
		AdminNoticeDTO deleteInfo = new AdminNoticeDTO();
		
		int noticeNO = Integer.parseInt(request.getParameter("noticeNo"));
		
		deleteInfo.setNoticeNo(noticeNO);
		
		int delete = deleteNotice.deleteNotice(deleteInfo,Integer.parseInt(request.getParameter("noticeNo")));
		
		String path="";
		if(delete > 0 ) {
			path= "/bonggeuda/notice/list";
			response.sendRedirect(path);
		} 
		
	}

}
