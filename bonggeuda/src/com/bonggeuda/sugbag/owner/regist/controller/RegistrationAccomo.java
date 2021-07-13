package com.bonggeuda.sugbag.owner.regist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationAccomo
 */
@WebServlet("/owner/registration")
public class RegistrationAccomo extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*등록 1단계로 이동*/
		String path="";

		path = "/WEB-INF/views/owner/registration/registration1.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
