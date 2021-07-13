package com.bonggeuda.sugbag.admin.owner.controller;

import static com.bonggeuda.sugbag.common.paging.PageNation.getPageInfo;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

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

import com.bonggeuda.sugbag.admin.common.dto.AttachmentDTO;
import com.bonggeuda.sugbag.admin.owner.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.admin.owner.model.dto.RoomInfoDTO;
import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class RmAccomoInsertServlet
 */
@WebServlet("/owner/rminsert")
public class RmInsertServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminService service = new AdminService();
		
		int requestNo = Integer.parseInt(request.getParameter("requestNo"));

		Map<String, Object> enMap = new HashMap<String, Object>();

		enMap = service.enInfoSelect(requestNo);
		
		String cancleReason = "";

		AccomoInfoDTO accomo = (AccomoInfoDTO) enMap.get("accomo");
		List<RoomInfoDTO> roomList = (List<RoomInfoDTO>) enMap.get("roomList");
		
		int roomInsertNo = roomList.size();
		int insertAccomoResult = 0;
		int insertRoomResult = 0;
		int updateResult = 0;
		
		List<AttachmentDTO> attList = new ArrayList<>();
		List<AttachmentDTO> attList2 = new ArrayList<>();
		
//		String ar = "a";
		attList = service.selectAttachment(requestNo, "a");
		
//		ar = "r";
		System.out.println("enAccomoNo : " + accomo.getEnAccomoNo());
		attList2 = service.selectAttachment(accomo.getEnAccomoNo(), "r");
		System.out.println("attList2 : " + attList2);
		
		if(enMap != null) {
			insertAccomoResult = service.accomoInsert(accomo, attList);
			
			if(insertAccomoResult >= 1) {
				insertRoomResult = service.roomInsert(roomList, attList2);
			}
		}
		
		int totalInsertCount = 0;
		int insertCount = 0;
		int insertHistoryCount = 0;
		
		totalInsertCount = 1 + attList.size() + roomList.size() + attList2.size();
		
		insertCount = insertAccomoResult + insertRoomResult;
		
//		전부다 insert완료 시 update, 이력 insert진행
		if(totalInsertCount == insertCount) {
			updateResult = service.updateRmList(enMap);
			insertHistoryCount = service.insertHistory(enMap, cancleReason);
		}
		
		String path="";
		if(insertAccomoResult >= 1 && insertRoomResult >= roomInsertNo) {
			path = "/WEB-INF/views/admin/common/success.jsp";
			request.setAttribute("successCode", "insert");
		}
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
