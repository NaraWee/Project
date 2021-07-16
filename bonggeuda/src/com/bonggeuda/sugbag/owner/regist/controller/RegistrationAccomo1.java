package com.bonggeuda.sugbag.owner.regist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.AccomoDTO;

/**
 * Servlet implementation class RegistrationAccomo
 */
@WebServlet("/registration1")
public class RegistrationAccomo1 extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*입력 값 받아오기*/
		String accomoName = request.getParameter("accomoName");
		String ceoName = request.getParameter("ceoName");
		String accomoType = request.getParameter("accomoType");
		String registNo = request.getParameter("registNo");
		String address = request.getParameter("address");
		String adrDetail = request.getParameter("adrDetail");
		String sumAddress = address + " " + adrDetail;
		String email = request.getParameter("email");
		String homepage = request.getParameter("homepage");
		
		
		/*전달받은 값을 넣어줄 객체 선언*/
		AccomoDTO accomoDTO = new AccomoDTO();
		
		accomoDTO.setAccomoName(accomoName);
		accomoDTO.setCeoName(ceoName);
		accomoDTO.setAccomoType(accomoType);
		accomoDTO.setRegistNo(registNo);
		accomoDTO.setAddress(sumAddress);
		accomoDTO.setAdrDetail(adrDetail);
		accomoDTO.setEmail(email);
		accomoDTO.setHomepage(homepage);
		
		/*숙소등록2번 jsp로 전달*/
		request.setAttribute("accomoDTO", accomoDTO);
		
		/*등록 2단계로 이동*/
		String path="";

		path = "/WEB-INF/views/owner/registration/registration2.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}
