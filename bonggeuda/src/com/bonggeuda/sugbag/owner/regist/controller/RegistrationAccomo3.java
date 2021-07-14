package com.bonggeuda.sugbag.owner.regist.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.model.dto.AccomoDTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.owner.regist.service.AccomoService;

/**
 * Servlet implementation class RegistrationAccomo3
 */
@WebServlet("/registration3")
public class RegistrationAccomo3 extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    HttpSession session = request.getSession();
	    int ownerNo = (Integer)session.getAttribute("ownerNo");

		
		/*등록3단계*/
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut"); 
		java.sql.Date peakStart = java.sql.Date.valueOf(request.getParameter("peakStart")); 
		java.sql.Date peakEnd = java.sql.Date.valueOf(request.getParameter("peakEnd")); 
		
		/*다시 DTO에 한번에 담아줌*/
		AccomoDTO accomoDTO = new AccomoDTO();
		
		/*값을 전달하기 위한 비지니스 로직 호출*/
		AccomoService accomoService = new AccomoService();
		
		/* 리퀘스트 넘의 넥스트발을 조회해서 그값을 둘다 넣어주기*/
		int selectRequestNextVal = Integer.parseInt(request.getParameter("selectRequestNextVal"));
		
		accomoDTO.setAccomoName(request.getParameter("accomoName"));
		accomoDTO.setCeoName(request.getParameter("ceoName"));
		accomoDTO.setAccomoType(request.getParameter("accomoType"));
		accomoDTO.setRegistNo(request.getParameter("registNo"));
		accomoDTO.setAddress(request.getParameter("address"));
		accomoDTO.setAdrDetail(request.getParameter("adrDetail"));
		accomoDTO.setEmail(request.getParameter("email"));
		accomoDTO.setHomepage(request.getParameter("homepage"));
		accomoDTO.setAccomoPath(request.getParameter("accomoPath"));
		accomoDTO.setNear(request.getParameter("near"));
		accomoDTO.setRule(request.getParameter("rule"));
		accomoDTO.setParking(request.getParameter("parking"));
		accomoDTO.setCheckIn(checkIn);
		accomoDTO.setCheckOut(checkOut);
		accomoDTO.setPeakStart(peakStart);
		accomoDTO.setPeakEnd(peakEnd);
		accomoDTO.setOwnerNo(ownerNo);
		
		accomoDTO.setRequsetNo(selectRequestNextVal);
		
		String[] arrayFacility = request.getParameterValues("facility");
		String facility = "";
		for(int i=0; i < arrayFacility.length; i++) {
			
			facility += arrayFacility[i];
			
			if(i < arrayFacility.length - 1) {
				facility += ", ";
			}
		}
		accomoDTO.setFacility(facility);
		
		
		System.out.println("arrayFacility"  + arrayFacility[1]);
		
		int insertAccomo = accomoService.InsertAccomoServlet(accomoDTO, ownerNo); //값을 int형으로 반환받아야 함

		
		String path="";

		path = "/WEB-INF/views/owner/registration/registration4.jsp";

		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
