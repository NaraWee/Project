package com.bonggeuda.sugbag.owner.book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.model.dto.SalesDTO;
import com.bonggeuda.sugbag.owner.book.service.SalesService;

/**
 * Servlet implementation class Sales
 */
@WebServlet("/owner/sales")
public class SalesList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 값
		HttpSession session = request.getSession();
		int ownerNo = (Integer)session.getAttribute("ownerNo"); 	
		
		SalesService salesService = new SalesService();
		int accmoNo = Integer.parseInt(request.getParameter("accomoNo"));
		String accomoName = request.getParameter("accomoName");
		

		
		/* 1. 객실명 받아오기 */
		List<String> roomNamsList = new ArrayList<String>();
		roomNamsList = salesService.selectRoomName(ownerNo,accmoNo);
		System.out.println(roomNamsList);
		
		/* 2. 숙소 총 예약 건수 조회 */
		int bookingCount = salesService.selectBookCount(accmoNo);
		
		/* 3. 숙소 총 매출 조회*/
		int sumSalePrice = salesService.sumSalePriceService(accmoNo);
		
		
		String path = "";
		path = "/WEB-INF/views/owner/bookingList/salesList.jsp";
		
		request.setAttribute("accomoName", accomoName);

		/* 1. 객실이름 보내주기 */
		request.setAttribute("roomNamsList", roomNamsList);
		/* 2. 숙소 총예약건수 보내주기*/
		request.setAttribute("bookingCount", bookingCount);
		/* 3. */
		request.setAttribute("sumSalePrice",sumSalePrice );

		

		request.getRequestDispatcher(path).forward(request, response);
	}

}
