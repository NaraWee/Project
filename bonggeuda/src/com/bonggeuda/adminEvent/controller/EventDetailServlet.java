package com.bonggeuda.adminEvent.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.adminEvent.dto.EventDTO;
import com.bonggeuda.adminEvent.service.AdminEventService;


/**
 * Servlet implementation class EventDetailServlet
 */
@WebServlet("/event/detail")
public class EventDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminEventService adminEventDetailService = new AdminEventService();
		System.out.println(request.getParameter("eventNo"));
		EventDTO eventDetailInfo = adminEventDetailService.selectEventDetail(Integer.parseInt(request.getParameter("eventNo")));
		List<EventDTO> eventThumnailInfo = new ArrayList<>();
		eventThumnailInfo = adminEventDetailService.selectEventThumnail(Integer.parseInt(request.getParameter("eventNo")));

		
		String path = "";
		
		if(eventDetailInfo != null) {
			path = "/WEB-INF/views/admin/event/eventDetail.jsp";
			request.setAttribute("eventDetailInfo", eventDetailInfo);
			request.setAttribute("eventThumnailInfo", eventThumnailInfo);
			request.setAttribute("eventNo", request.getParameter("eventNo"));
			
		} 
		

		request.getRequestDispatcher(path).forward(request, response);
	}

}
