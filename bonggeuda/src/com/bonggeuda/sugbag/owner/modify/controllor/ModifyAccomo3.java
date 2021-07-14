package com.bonggeuda.sugbag.owner.modify.controllor;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.model.dto.RmAccomoInfoDTO;
import com.bonggeuda.sugbag.owner.manage.service.ManagementRoomService;

/**
 * Servlet implementation class ModifyAccomo3
 */
@WebServlet("/owner/modifyAccomo3")
public class ModifyAccomo3 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 값 받아와서 인서트 해주기
		// 
		RmAccomoInfoDTO rmAcoomoDTO = new RmAccomoInfoDTO();
		//selectRequestNextVal
		int selectRequestNextVal = Integer.parseInt(request.getParameter("selectRequestNextVal"));
		
		int rmAccomoNo = Integer.parseInt(request.getParameter("rmAccomoNo"));
		String accomoName = request.getParameter("accomoName");
		String ceoName = request.getParameter("ceoName");
		String accomoType = request.getParameter("accomoType");
		String registNo = request.getParameter("registNo");
		String address = request.getParameter("address");
		String adrDetail = request.getParameter("adrDetail");
		String email = request.getParameter("email");
		String homepage = request.getParameter("homepage");
		String accomoPath = request.getParameter("accomoPath");
		String near = request.getParameter("near");
		String rule = request.getParameter("rule");
		String parking = request.getParameter("parking");
		String checkIn = request.getParameter("checkIn");
		String checkOut = "11:00";
		java.sql.Date peakStart = Date.valueOf(request.getParameter("peakStart"));
		java.sql.Date peakEnd = Date.valueOf(request.getParameter("peakEnd"));
		
		String[] arrayFacility = request.getParameterValues("facility");
		String facility = "";
		for(int i=0; i < arrayFacility.length; i++) {
			
			facility += arrayFacility[i];
			
			if(i < arrayFacility.length - 1) {
				facility += ", ";
			}
		}
		
		rmAcoomoDTO.setAccomoName(accomoName);
		rmAcoomoDTO.setRmAccomoNo(rmAccomoNo);
		rmAcoomoDTO.setAccomoPath(accomoPath);
		rmAcoomoDTO.setAccomoType(accomoType);
		rmAcoomoDTO.setAddress(address);
		rmAcoomoDTO.setCeoName(ceoName);
		rmAcoomoDTO.setCheckIn(checkIn);
		rmAcoomoDTO.setCheckOut(checkOut);
		rmAcoomoDTO.setEmail(email);
		rmAcoomoDTO.setFacility(facility);
		rmAcoomoDTO.setHomepage(homepage);
		rmAcoomoDTO.setNear(near);
		//로그인 값
	    HttpSession session = request.getSession();
	    int ownerNo = (Integer)session.getAttribute("ownerNo");
	    
		rmAcoomoDTO.setOwnerNo(ownerNo);
		rmAcoomoDTO.setParking(parking);
		rmAcoomoDTO.setPeakEnd(peakEnd);
		rmAcoomoDTO.setPeakStart(peakStart);
		rmAcoomoDTO.setRegistNo(registNo);
		rmAcoomoDTO.setRule(rule);
		
		
		// 인서트 해주기
		ManagementRoomService insertRoom = new ManagementRoomService();
		
		int insertResult = insertRoom.insertRmAccomo(rmAcoomoDTO,selectRequestNextVal);
		if(insertResult>0) {
			request.setAttribute("rmAcoomoDTO", rmAcoomoDTO);
			
			String path = "";
			
			path = "/WEB-INF/views/owner/roomModify/ModifyAccomoSuccess.jsp";
			request.getAttribute(path);
			
			//request.setAttribute("successCode", "insertThumbnail");
			
			request.getRequestDispatcher(path).forward(request, response);
			
		}
		
		
//		rmAcoomoDTO.setAccomoName(accomoName);
//		rmAcoomoDTO.setAccomoNo(accomoNo);
//		rmAcoomoDTO.set
	}

}
