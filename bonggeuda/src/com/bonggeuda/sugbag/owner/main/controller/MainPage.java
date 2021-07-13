package com.bonggeuda.sugbag.owner.main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MainPage
 */
@WebServlet("/owner/main")
public class MainPage extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*메인으로 이동*/
		String path="";
		path = "/WEB-INF/views/owner/main/main.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

}
