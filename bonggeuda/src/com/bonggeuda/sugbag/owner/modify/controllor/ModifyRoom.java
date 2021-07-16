package com.bonggeuda.sugbag.owner.modify.controllor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.RoomDTO;
import com.bonggeuda.sugbag.owner.manage.service.ManagementRoomService;

/**
 * Servlet implementation class ModifyRoom
 * 
 */
@WebServlet("/owner/roomModify")
public class ModifyRoom extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 넘겨온 룸 넘버를 조회해서 객실 에 뿌려주기 */
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		
		RoomDTO roomDTO = new RoomDTO();
		
		ManagementRoomService roomService = new ManagementRoomService();
		
		roomDTO = roomService.selectRoomInfo(roomNo);
		
		/* 숙소 수정중인지 카운트 해서 뿌려주기 */
		int rmRoomCount = roomService.rmRoomCountService(roomNo);
		
		
		
		String path="";
	     if(rmRoomCount > 0) {
	    	 path = "/WEB-INF/views/owner/roomManagement/thisRoomRM.jsp";
	    	 request.getAttribute(path);
	    	 request.getRequestDispatcher(path).forward(request, response);
	    	 
	     }else {
	    	 
	    	 request.setAttribute("roomDTO", roomDTO);
	    	 
	    	 path = "/WEB-INF/views/owner/roomModify/roomModify.jsp";
	    	 request.getAttribute(path);
	    	 request.getRequestDispatcher(path).forward(request, response);
	    	 

	     }
		
		

	}

}
