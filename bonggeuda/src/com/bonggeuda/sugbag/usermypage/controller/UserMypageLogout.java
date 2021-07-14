package com.bonggeuda.sugbag.usermypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserMypageLogout
 */
@WebServlet("/usermypage/logout")
public class UserMypageLogout extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getSession().invalidate();
		
		response.sendRedirect(request.getContextPath());
		
	}


}
