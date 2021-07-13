package com.bonggeuda.sugbag.admin.owner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.owner.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.admin.owner.model.dto.RoomInfoDTO;
import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class RmUpdateServlet
 */
@WebServlet("/owner/rmupdate")
public class RmUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accomoRequestNo = request.getParameter("accomoRequestNo");
		String roomRequestNo = request.getParameter("roomRequestNo");
		
		AdminService service = new AdminService();
		int updateResult = 0;
		int insertHistory = 0;
		int updateRmList = 0;
		int requestNo = 0;
		int totalCount = 0;
		String cancleReason = "";
		String path = "";
		
		Map<String, Object> updateMap = new HashMap<String, Object>();
		
		if(!accomoRequestNo.equals("")) {
			
			requestNo = Integer.parseInt(accomoRequestNo);
			
			AccomoInfoDTO accomo = service.rmAccomoInfo(requestNo);
			updateMap.put("accomo", accomo);
			updateMap.put("roomList", null);
			
			if(accomo != null) {
				updateResult = service.updateAccomo(accomo);
			}
			
			if(updateResult >= 2) {
				updateRmList = service.updateRmList(updateMap);
				insertHistory = service.insertHistory(updateMap, cancleReason);
			}
			
			totalCount = updateResult + updateRmList + insertHistory;
			if(totalCount == 4) {
				path = "/WEB-INF/views/admin/common/success.jsp";
				request.setAttribute("successCode", "update");
			}
			request.getRequestDispatcher(path).forward(request, response);
			
		} else if(!roomRequestNo.equals("")) {
			
			requestNo = Integer.parseInt(roomRequestNo);
			
			List<RoomInfoDTO> roomList = new ArrayList<RoomInfoDTO>();
					
			roomList.add(service.rmRoomInfo(requestNo));
			
			updateMap.put("accomo", null);
			updateMap.put("roomList", roomList);
			
			if(roomList != null) {
				updateResult = service.updateRoom(roomList);
			}
			
			if(updateResult >= 2) {
				updateRmList = service.updateRmList(updateMap);
				insertHistory = service.insertHistory(updateMap, cancleReason);
			}
			
			totalCount = updateResult + updateRmList + insertHistory;
			if(totalCount == 4) {
				path = "/WEB-INF/views/admin/common/success.jsp";
				request.setAttribute("successCode", "update");
			}
			request.getRequestDispatcher(path).forward(request, response);
		}
	}
}
