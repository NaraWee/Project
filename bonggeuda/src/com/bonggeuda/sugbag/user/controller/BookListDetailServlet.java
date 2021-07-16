package com.bonggeuda.sugbag.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.user.dto.ReservationDetailDTO;
import com.bonggeuda.sugbag.user.dto.UserInfoDTO;
import com.bonggeuda.sugbag.user.dto.UserReservationStatusDTO;
import com.bonggeuda.sugbag.user.service.UserInfoService;

/**
 * 사용자예약현황 상세보기 불러오는 서블릿
 * Servlet implementation class UserBookListDetailServlet
 */
@WebServlet("/book/detail")
public class BookListDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserInfoService userInfoService = new UserInfoService();
		
		ReservationDetailDTO userReservationInfo = userInfoService.selectStatusDetail(request.getParameter("bookNo"));
		
		System.out.println(userReservationInfo);
		
		String path = "";
		
		if(userReservationInfo != null) {
			path = "/WEB-INF/views/admin/user/userReservationDetail.jsp";
			request.setAttribute("userReservationInfo", userReservationInfo);
		} 
		

		request.getRequestDispatcher(path).forward(request, response);
	}

}
