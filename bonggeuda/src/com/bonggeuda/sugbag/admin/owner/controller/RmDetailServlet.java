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
 * Servlet implementation class RmAccomoDetailServlet
 */
@WebServlet("/owner/rmdetail")
public class RmDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int requestNo = Integer.parseInt(request.getParameter("requestNo"));
		
		String sortCondition1 = request.getParameter("sortCondition1");
		String sortCondition2 = request.getParameter("sortCondition2");
		String sortCondition3 = request.getParameter("sortCondition3");
		
		AdminService service = new AdminService();
		
		Map<String, Object> enMap = new HashMap<String, Object>();
		
		if(sortCondition2.equals("EN")) {
			enMap = service.enInfoSelect(requestNo);
			
			AccomoInfoDTO accomo = (AccomoInfoDTO)enMap.get("accomo");
			List<RoomInfoDTO> roomList = (List<RoomInfoDTO>)enMap.get("roomList");
			
			String path="";
			if(enMap != null) {
				
				path = "/WEB-INF/views/admin/owner/rmAccomoInfo.jsp";
				request.setAttribute("accomo", accomo);
				request.setAttribute("roomList", roomList);
				System.out.println("sort check1 : " + sortCondition1);
				System.out.println("sort check2 : " + sortCondition2);
				System.out.println("sort check3 : " + sortCondition3);
				request.setAttribute("sortCondition1", sortCondition1);
				request.setAttribute("sortCondition2", sortCondition2);
				request.setAttribute("sortCondition3", sortCondition3);
			}
			request.getRequestDispatcher(path).forward(request, response);
			
		} else if(sortCondition2.equals("RM")) {
			
			AccomoInfoDTO accomo = null;
			List<RoomInfoDTO> roomList = null;
			RoomInfoDTO room = new RoomInfoDTO();
			
			if(sortCondition3.equals("accomo")) {
				
				accomo = service.rmAccomoInfo(requestNo);
				
			} else if(sortCondition3.equals("room")) {
				roomList = new ArrayList<RoomInfoDTO>();
				
				room = service.rmRoomInfo(requestNo);
				
				roomList.add(room);
			}
			
			String path = "";
			if(accomo != null) {
				path = "/WEB-INF/views/admin/owner/rmAccomoInfo.jsp";
				request.setAttribute("accomo", accomo);
				request.setAttribute("sortCondition1", sortCondition1);
				request.setAttribute("sortCondition2", sortCondition2);
				request.setAttribute("sortCondition3", sortCondition3);
				request.getRequestDispatcher(path).forward(request, response);
			}
			if(roomList != null) {
				path = "/WEB-INF/views/admin/owner/rmAccomoInfo.jsp";
				request.setAttribute("roomList", roomList);
				request.setAttribute("sortCondition1", sortCondition1);
				request.setAttribute("sortCondition2", sortCondition2);
				request.setAttribute("sortCondition3", sortCondition3);
				request.getRequestDispatcher(path).forward(request, response);
			}
			
		}
		
	}

}
