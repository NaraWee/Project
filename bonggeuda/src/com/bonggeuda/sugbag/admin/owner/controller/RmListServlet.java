package com.bonggeuda.sugbag.admin.owner.controller;

import java.io.IOException;

import static com.bonggeuda.sugbag.common.paging.PageNation.getPageInfo;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

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
 * Servlet implementation class RmAccomoListServlet
 */
@WebServlet("/owner/rmlist")
public class RmListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService service = new AdminService();
		Map<String, Object> totalRmMap = new HashMap<String, Object>();
		String yn = "N";
		String enRm = "EN";
		String accomoRoom = "accomo";
		String sortCondition1 = request.getParameter("sortCondition1");
		String sortCondition2 = request.getParameter("sortCondition2");
		String sortCondition3 = request.getParameter("sortCondition3");
		
		if(sortCondition1 != null && !sortCondition1.equals("")) {
			yn = sortCondition1;
		} else {
			sortCondition1 = yn;
		}
		
		if(sortCondition2 != null && !sortCondition2.equals("")) {
			enRm = sortCondition2;
		} else {
			sortCondition2 = enRm;
		}
		
		if(sortCondition3 != null && !sortCondition3.equals("")) {
			accomoRoom = sortCondition3;
		} else {
			sortCondition3 = accomoRoom;
		} 
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		if(currentPage != null && !currentPage.equals("")) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		List<AccomoInfoDTO> accomoRmList = new ArrayList<AccomoInfoDTO>();
		List<RoomInfoDTO> roomRmList = new ArrayList<RoomInfoDTO>();
		
		// 처리 완료/ 처리 대기 분류'
		totalRmMap = service.accomoRMList(yn);
		
		// 그중 숙소와 객실로 분류
		accomoRmList = (List<AccomoInfoDTO>)totalRmMap.get("accomoRmList");
		roomRmList = (List<RoomInfoDTO>)totalRmMap.get("roomRmList");
		
		List<AccomoInfoDTO> accomoSortList = new ArrayList<AccomoInfoDTO>();
		List<RoomInfoDTO> roomSortList = new ArrayList<RoomInfoDTO>();
		
		// rm(수정) en(등록)으로 분류
		for(AccomoInfoDTO rmAccomoInfo : accomoRmList) {
			if(rmAccomoInfo.getRmType().equals(enRm)) {
				accomoSortList.add(rmAccomoInfo);
			} 
		}
		for(RoomInfoDTO rmRoomInfo : roomRmList) {
			if(rmRoomInfo.getRmType().equals(enRm)) {
				roomSortList.add(rmRoomInfo);
			}
		}
		
		int totalYNCount = 0;
		// 등록 수정 분류 완료, 그중 객실, 숙소 구분
		// 등록 일시 객실만 보여줌
		roomSortList.size();
		if(accomoRoom.equals("accomo")) {
			totalYNCount = accomoSortList.size();
		} else if(accomoRoom.equals("room")) {
			totalYNCount = roomSortList.size();
		}
		PageInfoDTO pageInfo = getPageInfo(pageNo, totalYNCount, 5, 5);
		
		List<AccomoInfoDTO> pageAccomoList = new ArrayList<AccomoInfoDTO>();
		List<RoomInfoDTO> pageRoomList = new ArrayList<RoomInfoDTO>();
		
		// 페이징 처리
		if(accomoRoom.equals("accomo")) {
			for(int i = 1; i <= accomoSortList.size(); i++) {
				if(i >= pageInfo.getStartRow() && i <= pageInfo.getEndRow()) {
					pageAccomoList.add(accomoSortList.get(i -1));
				}
			}
		} else if(accomoRoom.equals("room")){
			for(int i = 1; i <= roomSortList.size(); i++) {
				if(i >= pageInfo.getStartRow() && i <= pageInfo.getEndRow()) {
					pageRoomList.add(roomSortList.get(i -1));
				}
			}
		}
		
		String path = "";
		if(totalRmMap != null) {
			if(accomoRoom.equals("accomo")) {
				path = "/WEB-INF/views/admin/owner/rmAccomoList.jsp";
				request.setAttribute("pageAccomoList", pageAccomoList);
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("sortCondition1", sortCondition1);
				request.setAttribute("sortCondition2", sortCondition2);
				request.setAttribute("sortCondition3", sortCondition3);
				
			} else if(accomoRoom.equals("room")) {
				path = "/WEB-INF/views/admin/owner/rmAccomoList.jsp";
				request.setAttribute("pageRoomList", pageRoomList);
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("sortCondition1", sortCondition1);
				request.setAttribute("sortCondition2", sortCondition2);
				request.setAttribute("sortCondition3", sortCondition3);
			}
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
}
