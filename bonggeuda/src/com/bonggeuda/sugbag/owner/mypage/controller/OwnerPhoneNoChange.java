package com.bonggeuda.sugbag.owner.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.owner.mypage.service.OwnerMypagService;

/**
 * Servlet implementation class OwnerPhoneNoChange
 */
@WebServlet("/owner/phoneNoChange")
public class OwnerPhoneNoChange extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String phone = request.getParameter("ownerPhonechange");
		
		//로그인 값
	    HttpSession session = request.getSession();
	    int ownerNo = (Integer)session.getAttribute("ownerNo");
		
		OwnerMypagService ownerService = new OwnerMypagService();
		
		int result = ownerService.updatePhoneNo(ownerNo,phone);
		
		String path="";

		path = "/WEB-INF/views/owner/main/main.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
