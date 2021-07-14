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
 * Servlet implementation class RmAccomoCancleServlet
 */
@WebServlet("/owner/rmcancle")
public class RmCancleServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AdminService service = new AdminService();

		String requestAccomoNo = request.getParameter("requestAccomoNo");
		String requestRoomNo = request.getParameter("requestRoomNo");
		String cancleReason = request.getParameter("cancleReason");
		String sortCondition2 = request.getParameter("sortCondition2");
		
		int insertHistoryCount = 0;
		int updateResult = 0;
		int accomoNo = 0;
		int roomNo = 0;
		int totalCount = 0;
		
		int requestIntNo = 0;
		
		String path = "";
		
		Map<String, Object> enMap = new HashMap<String, Object>();
		
		if(sortCondition2.equals("EN")) {
			
			requestIntNo = Integer.parseInt(requestAccomoNo);
			List<RoomInfoDTO> roomList = new ArrayList<RoomInfoDTO>();
			
			enMap = service.enInfoSelect(requestIntNo);
			
			AccomoInfoDTO accomo = (AccomoInfoDTO) enMap.get("accomo");
			
			roomList = (List<RoomInfoDTO>) enMap.get("roomList");
			
			updateResult = service.updateRmList(enMap);
			
			insertHistoryCount = service.insertHistory(enMap, cancleReason);
			
			totalCount = (1 + roomList.size()) * 2;
			
			if(totalCount == (updateResult + insertHistoryCount)) {
				path = "/WEB-INF/views/admin/common/success.jsp";
				request.setAttribute("successCode", "cancle");
			}
			request.getRequestDispatcher(path).forward(request, response);
			
		} else {
			
			if(requestAccomoNo != null && !requestAccomoNo.equals("")) {
				requestIntNo = Integer.parseInt(requestAccomoNo);
				AccomoInfoDTO accomo = service.rmAccomoInfo(requestIntNo);
				
				enMap.put("accomo", accomo);
				enMap.put("roomList", null);
				
				updateResult = service.updateRmList(enMap);
				
				insertHistoryCount = service.insertHistory(enMap, cancleReason);
				
				totalCount = 2;
				
				if(totalCount == (updateResult + insertHistoryCount)) {
					path = "/WEB-INF/views/admin/common/success.jsp";
					request.setAttribute("successCode", "cancle");
				}
				
				request.getRequestDispatcher(path).forward(request, response);
				
			} else if(requestRoomNo != null && !requestRoomNo.equals("")) {
				requestIntNo = Integer.parseInt(requestRoomNo);
				List<RoomInfoDTO> roomList = new ArrayList<RoomInfoDTO>();
				
				RoomInfoDTO room = service.rmRoomInfo(requestIntNo);
				
				roomList.add(room);
				
				enMap.put("accomo", null);
				enMap.put("roomList", roomList);
				
				updateResult = service.updateRmList(enMap);
				
				insertHistoryCount = service.insertHistory(enMap, cancleReason);
				
				totalCount = 2;
				
				if(totalCount == (updateResult + insertHistoryCount)) {
					path = "/WEB-INF/views/admin/common/success.jsp";
					request.setAttribute("successCode", "cancle");
				}
				request.getRequestDispatcher(path).forward(request, response);
				
				
			}
			
			
		}

	}

}
