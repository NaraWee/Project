package com.bonggeuda.sugbag.user.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.user.dto.UserCouponDTO;
import com.bonggeuda.sugbag.user.service.UserInfoService;


/**
 * 사용자 쿠폰추가 화면에서 쿠폰추가를 누르면 insert가 되게 하는 서블릿 
 * Servlet implementation class CouponInsertServlet
 */
@WebServlet("/coupon/insert")
public class CouponInsertServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path="";

			path="/WEB-INF/views/admin/user/addCoupon.jsp";

		request.setAttribute("user", request.getParameter("hduserNo"));
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("세번째 확인 : " + request.getParameter("hduserNo"));
		
		UserInfoService userInfoService = new UserInfoService();
		UserCouponDTO  dto = new UserCouponDTO();
		
		String couponName = request.getParameter("couponName");
		Date.valueOf(request.getParameter("startDate")); 
		Date.valueOf(request.getParameter("endDate")); 
		int condition = Integer.parseInt(request.getParameter("condition")); //상태여부 얼먀넘어면 사용가능
		int discount = Integer.parseInt(request.getParameter("discount"));
		
		dto.setCouponName(couponName);
		dto.setStartDate(Date.valueOf(request.getParameter("startDate")));
		dto.setEndDate(Date.valueOf(request.getParameter("endDate")));
		dto.setCondition(condition);
		dto.setDiscount(discount);

		int insertCoupon = userInfoService.insertCoupon(dto,Integer.parseInt(request.getParameter("hduserNo")));

		String path="";
		if(insertCoupon > 0 ) {
			path= "/bonggeuda/user/list";
			response.sendRedirect(path);
		} 
		
//		System.out.println(path);
//		System.out.println(request.getContextPath());
//		request.getRequestDispatcher(path).forward(request, response);
	}
	
}
