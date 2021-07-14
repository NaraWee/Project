package com.bonggeuda.sugbag.owner.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Frequently
 */
@WebServlet("/owner/frequently")
public class Frequently extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*자주묻는질문으로 이동*/
		String path="";
		path = "/WEB-INF/views/owner/notice/frequently.jsp";
		request.getRequestDispatcher(path).forward(request, response);	
	}
}
