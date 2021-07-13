package com.bonggeuda.sugbag.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.user.dto.UserInfoDTO;
import com.bonggeuda.sugbag.user.service.UserInfoService;

@WebServlet("/user/detail")
public class ManagementDetailServlet extends HttpServlet {

	/**
	 * 사용자 관리 리스트에서 상세보기 누르면 실행되는 서블릿 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserInfoService userInfoService = new UserInfoService();
		
		UserInfoDTO userInfo = userInfoService.selectDetail(request.getParameter("hduserNo"));
		
		String path = "";
		
		if(userInfo != null) {
			path = "/WEB-INF/views/admin/user/userInfoDetail.jsp";
			request.setAttribute("userInfo", userInfo);
			request.setAttribute("hduserNo", request.getParameter("hduserNo"));
			
		} 
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
