package com.bonggeuda.sugbag.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLoginTest
 */
@WebServlet("/login/admin")
public class AdminLoginTest extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		MemberDTO member = new MemberDTO(1,"user01","pass01","010-1111-1111",0,"넘버원","N","U",new java.sql.Date(System.currentTimeMillis()), null);
//		HttpSession session = request.getSession();
//		session.setAttribute("member", member);
		request.getRequestDispatcher("/WEB-INF/views/admin/user/userInfo.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
