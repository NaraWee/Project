package com.bonggeuda.sugbag.usermypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.service.UserMypageService;

/**
 * Servlet implementation class MyinfoSelectServlet
 */
@WebServlet("/usermyinfo/select")
public class UserMyinfoSelectServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		
		UserMypageService mypageService = new UserMypageService();
		
		/* 내정보 닉네임, 번호, 신고횟수 조회 */
		MemberDTO userMyinfo = mypageService.myinfoSelect(userNo);
		
		

		String path = "";
			
		path = "/WEB-INF/views/guest/mypage/myInformation.jsp";
		request.setAttribute("userMyinfo", userMyinfo);
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
