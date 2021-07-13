package com.bonggeuda.sugbag.usermypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.UserBookContentDTO;
import com.bonggeuda.sugbag.service.UserMypageService;

/**
 * Servlet implementation class UserCancleContentSelect
 */
@WebServlet("/usercanclecontent/select")
public class UserCancleContentSelect extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
				
		UserMypageService mypageService = new UserMypageService();
		
		UserBookContentDTO userCancleContent = mypageService.selectCancleContent(userNo, bookNo);
		
		
		String path = "/WEB-INF/views/guest/mypage/cancelList.jsp";
		request.setAttribute("userCancleContent", userCancleContent);
		
		request.getRequestDispatcher(path).forward(request, response);
	
	}

}
