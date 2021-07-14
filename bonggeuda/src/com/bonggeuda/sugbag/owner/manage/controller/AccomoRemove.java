package com.bonggeuda.sugbag.owner.manage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.owner.manage.service.ManagementRoomService;

/**
 * Servlet implementation class AccomoRemove
 */
@WebServlet("/owner/AccomoRemove")
public class AccomoRemove extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int accomoNo = Integer.parseInt(request.getParameter("acomoNo"));
		
		ManagementRoomService manageService = new ManagementRoomService();
		
		int romoveResult = manageService.deleteAccomo(accomoNo);
		
		if(romoveResult > 0) {
			
			String path="";

			path = "/WEB-INF/views/owner/roomManagement/accomoDeleteSuccess.jsp";
			
			request.getRequestDispatcher(path).forward(request, response);
			
		}else {
			String path="";

			path = "/WEB-INF/views/owner/main/main.jsp";
			
			request.getRequestDispatcher(path).forward(request, response);
			
		}


	}

}
