package com.bonggeuda.sugbag.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.service.LoginService;

/**
 * Servlet implementation class UserInfoDuplicationServlet
 */
@WebServlet("/userinfo/duplication")
public class UserInfoDuplicationServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LoginService loginService = new LoginService();
		
		/* 닉네임 중복체크 시 필요한 정보 조회 */
		String nickName = request.getParameter("intputNickname");
		System.out.println(nickName);
		
		int intputNickname = loginService.selectUserNickName(nickName);
		
		/* 이메일 중복체크 시 필요한 정보 조회*/
		String email = request.getParameter("intputEmail");
		System.out.println(email);
		
		int intputEmail = loginService.selectUserEmail(email);
		
		System.out.println(intputNickname);
		System.out.println(intputEmail);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(intputEmail);
		out.print(intputNickname);
		
		out.flush();
		out.close();
	}

}
