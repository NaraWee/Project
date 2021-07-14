package com.bonggeuda.sugbag.owner.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.NoticeDTO;
import com.bonggeuda.sugbag.owner.notice.service.NoticeService;

/**
 * Servlet implementation class Notice
 */
@WebServlet("/owner/notice")
public class Notice extends HttpServlet {	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		NoticeService noticeService = new NoticeService();

		/*결과값 반환*/
		List<NoticeDTO> selectNotice = noticeService.selectNotice();
		
		request.setAttribute("selectNotice", selectNotice);
		
		/*공지사항으로 이동*/
		String path="";
		path = "/WEB-INF/views/owner/notice/notice.jsp";
		request.getRequestDispatcher(path).forward(request, response);	
	}
	
}
