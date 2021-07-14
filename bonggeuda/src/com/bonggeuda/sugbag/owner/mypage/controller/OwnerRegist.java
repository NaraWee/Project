package com.bonggeuda.sugbag.owner.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OwnerRegist
 */
@WebServlet("/owner/regist")
public class OwnerRegist extends HttpServlet {

	/**
	 * 회원 가입 페이지로 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "";
		path = "/WEB-INF/views/common/ownerRegist.jsp";

		request.getRequestDispatcher(path).forward(request, response);
	}


	/**
	 * 회원 정보 맞게 입력시 회원 정보 인서트 및 페이지 이동
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
