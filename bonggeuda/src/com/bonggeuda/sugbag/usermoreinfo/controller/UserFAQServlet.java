package com.bonggeuda.sugbag.usermoreinfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.MemberDTO;

/**
 * Servlet implementation class UserFAQServlet
 */
@WebServlet("/userfaq/select")
public class UserFAQServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		
		String path = "/WEB-INF/views/guest/moreNotice/FAQ.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
