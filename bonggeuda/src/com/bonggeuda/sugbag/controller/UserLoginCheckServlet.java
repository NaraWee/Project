package com.bonggeuda.sugbag.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.service.LoginService;

/**
 * Servlet implementation class LoginCheckServlet
 */
@WebServlet("/login/check/user")
public class UserLoginCheckServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String loginEmail = request.getParameter("loginEmail");
		String loginPassword = request.getParameter("loginPassword");
		
		LoginService loginService = new LoginService();
		
		MemberDTO loginMember = loginService.userLoginCheck(loginEmail, loginPassword);
		
		if(loginMember != null && loginMember.getUserNo() != 0) {			// 사용자 로그인
			
			HttpSession session = request.getSession();
			session.setAttribute("member", loginMember);
			
			String page = "/WEB-INF/views/guest/moreNotice/narasuccess.jsp";
			request.setAttribute("successCode", "userLogin");
			request.getRequestDispatcher(page).forward(request, response);
			
		} else {
			request.setAttribute("failedCode", "loginFail");
			request.getRequestDispatcher("/WEB-INF/views/common/failed.jsp").forward(request, response);
		}
		
	}

}
