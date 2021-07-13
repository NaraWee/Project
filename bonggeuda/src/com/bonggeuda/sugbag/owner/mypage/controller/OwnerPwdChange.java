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
 * Servlet implementation class OwnerPwdChange
 */
@WebServlet("/owner/passwordChange")
public class OwnerPwdChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	/**
	 * 비밀번호 확인에 입력해준 비밀 번호로 변경해주는 메소드
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pwd = request.getParameter("ownerPwdChange");
		
		//로그인 값
	    HttpSession session = request.getSession();
	    int ownerNo = (Integer)session.getAttribute("ownerNo");
		
		OwnerMypagService ownerService = new OwnerMypagService();
		/* 오너 넘의 비밀번호 변경 */
		
		int result = ownerService.updatePwd(pwd,ownerNo);
		
		if(result > 0) {
			
			String path = "";
			path = "/WEB-INF/views/owner/main/main.jsp";

			request.getRequestDispatcher(path).forward(request, response);
		}
		
		
		
	}

}
