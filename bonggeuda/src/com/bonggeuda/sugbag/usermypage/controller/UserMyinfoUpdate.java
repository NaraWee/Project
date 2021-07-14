package com.bonggeuda.sugbag.usermypage.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.service.UserMypageService;

/**
 * Servlet implementation class UserMyinfoUpdateNickName
 */
@WebServlet("/usermyinfo/update")
public class UserMyinfoUpdate extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		
		request.setCharacterEncoding("UTF-8");
		
		UserMypageService mypageService = new UserMypageService();
		MemberDTO userMyinfo = new MemberDTO();
		
		userMyinfo.setUserNo(userNo);
		userMyinfo.setNickName(request.getParameter("userNickName"));
		userMyinfo.setUserPhone(request.getParameter("userPhone"));
		userMyinfo.setUserPwd(request.getParameter("userPwd"));
		
		int result = mypageService.updateUserinfo(userMyinfo);
		
		if(result > 0) {
			
			String page = "/WEB-INF/views/guest/moreNotice/narasuccess.jsp";
			request.setAttribute("successCode", "infoUpdate");
			request.getRequestDispatcher(page).forward(request, response);
			
		}
		
	}

}
