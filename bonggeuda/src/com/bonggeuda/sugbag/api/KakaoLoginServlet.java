package com.bonggeuda.sugbag.api;

import java.io.IOException;
//import java.net.http.HttpHeaders;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class KakaoLoginServlet
 */
@WebServlet("/user/kakao/login")
public class KakaoLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(request.getParameter("code"));		
		
		request.getRequestDispatcher("/WEB-INF/views/guest/main/main.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
