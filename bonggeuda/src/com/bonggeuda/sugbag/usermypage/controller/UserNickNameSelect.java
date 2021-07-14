package com.bonggeuda.sugbag.usermypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.service.UserMypageService;

/**
 * Servlet implementation class UserNickNameSelect
 */
@WebServlet("/usernickname/select")
public class UserNickNameSelect extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 닉네임 중복체크 시 필요한 정보 조회 */
		String inputNickName = request.getParameter("intputNickname");
		
		UserMypageService mypageService = new UserMypageService();
		
		int userNickname = mypageService.selectUserNickName(inputNickName);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(userNickname);
		
		out.flush();
		out.close();
		
	}

}
