package com.bonggeuda.sugbag.adminNotice.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.adminNotice.dto.AdminNoticeDTO;
import com.bonggeuda.sugbag.adminNotice.service.AdminNoticeService;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/notice/update")
public class NoticeUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminNoticeService updateNotice = new AdminNoticeService();
		AdminNoticeDTO noticeInfo = new AdminNoticeDTO();
		
		String content = request.getParameter("content"); 
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		
		noticeInfo.setContent(content);
		noticeInfo.setTitle(title);
		noticeInfo.setWriter(writer);

		int update = updateNotice.updateNoitce(noticeInfo,Integer.parseInt(request.getParameter("noticeNo")));
		
		Map<String,String[]> requestMap = request.getParameterMap();
	      Set<String> keySet = requestMap.keySet();
	      Iterator<String> keyIter = keySet.iterator();
	      while(keyIter.hasNext()) {
	         String key = keyIter.next();
	         String[] value = requestMap.get(key);
	         
	         System.out.println("key : " + key);
	         for(int i = 0; i < value.length; i++) {
	            System.out.println("value[" + i + "] : " +value[i]);
	         }
	      }
		String path="";
		if(update > 0 ) {
			path= "/bonggeuda/notice/list";
			response.sendRedirect(path);
		} 
		
		
	}

}
