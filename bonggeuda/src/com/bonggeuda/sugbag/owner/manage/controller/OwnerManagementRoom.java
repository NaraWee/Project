package com.bonggeuda.sugbag.owner.manage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.model.dto.AccomoDTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.model.dto.RmAccomoInfoDTO;
import com.bonggeuda.sugbag.model.dto.RoomDTO;
import com.bonggeuda.sugbag.owner.manage.service.ManagementRoomService;

/**
 * Servlet implementation class OwnerManagementRoom
 */
@WebServlet("/owner/managementRoom")
public class OwnerManagementRoom extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		//로그인 값
		HttpSession session = request.getSession();
		int ownerNo = (Integer)session.getAttribute("ownerNo");

		/* 전체 게시물 수가 필요 */
		/* 게시물 수가 0 이상인 경우 yesRoom jsp 로 이동 / 반대는 노룸 */
		/* 데이터베이스에서 먼저 전체 게시물 수를 조회 */
		ManagementRoomService accomoBoardService = new ManagementRoomService();
		int houseCount = accomoBoardService.selectHasRoom(ownerNo);
		// 카운트를 조회해 오니까 int

		/* 조회해온 오너 넘버를 이용해서 accomo DTO 리스트로 가져오기 */
		/*
		 * 총 3번 조회 해야한다.
		 *  1. 숙소 승인된 리스트 (숙소 수정 가능한 숙소 목록들 리스트에 담아두기
		 */
		List<AccomoDTO> approveAccomoList = new ArrayList<>();
		approveAccomoList = accomoBoardService.selectApproveAccomoService(ownerNo);

		/* 2. 숙소 승인 대기중인 리스트 */
		List<RmAccomoInfoDTO> applyEnrollAccomoList = new ArrayList<RmAccomoInfoDTO>();
		applyEnrollAccomoList = accomoBoardService.selectApplyEnrollAccomoList(ownerNo);

		/* 3. 숙소 승인 거절된 숙소 리스트 */
		List<RmAccomoInfoDTO> rejectAccomoList = new ArrayList<RmAccomoInfoDTO>();
		rejectAccomoList = accomoBoardService.selectApplyRejectAccomoList(ownerNo);



		/* 조회 해오면페이지 이동. */
		String path = "";

		if (houseCount > 0) {
			request.setAttribute("approveAccomoList", approveAccomoList);
			request.setAttribute("applyEnrollAccomoList", applyEnrollAccomoList);
			request.setAttribute("rejectAccomoList", rejectAccomoList);

			path = "/WEB-INF/views/owner/roomManagement/managementYesRoom.jsp";
			request.getAttribute(path);
			request.getRequestDispatcher(path).forward(request, response);

		} else {
			path = "/WEB-INF/views/owner/roomManagement/managementNoRoom.jsp";
			request.getAttribute(path);
			request.getRequestDispatcher(path).forward(request, response);
		}

	}
	
}