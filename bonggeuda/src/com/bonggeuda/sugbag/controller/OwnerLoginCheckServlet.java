package com.bonggeuda.sugbag.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.service.LoginService;

/**
 * Servlet implementation class OwnerLoginCheckServlet
 */
@WebServlet("/login/check/owner")
public class OwnerLoginCheckServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String loginEmail = request.getParameter("loginEmail");
		String loginPassword = request.getParameter("loginPassword");
		
		System.out.println("loginEmail : " + loginEmail);
		System.out.println("loginPassword : " + loginPassword);
		
		LoginService loginService = new LoginService();
		
		OwnerInfoDTO loginMember = loginService.ownerLoginCheck(loginEmail, loginPassword);
		
		System.out.println(loginMember);
		
		if(loginMember != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("ownerNo", loginMember.getOwnerNo());
			System.out.println(loginMember.getOwnerNo());
			System.out.println("체크서블릿");
			
//			System.out.println("request.getContextPath() : " + request.getContextPath());
//			response.sendRedirect(request.getContextPath());
			
			String page = "/WEB-INF/views/guest/moreNotice/narasuccess.jsp";
			request.setAttribute("successCode", "ownerLogin");
			request.getRequestDispatcher(page).forward(request, response);
			
		} else {
			request.setAttribute("failedCode", "loginFail");
			request.getRequestDispatcher("/WEB-INF/views/common/failed.jsp").forward(request, response);
		}
	}

}
