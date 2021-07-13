package com.bonggeuda.sugbag.usermoreinfo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.service.UserMoreInfoService;

/**
 * Servlet implementation class UserQnAInsert
 */
@WebServlet("/adminqna/insert")
public class AdminQnAInsert extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		
		request.setCharacterEncoding("UTF-8");
		
		UserMoreInfoService  moreinfoService = new UserMoreInfoService();
		
		AdminQnADTO adminQnA = new AdminQnADTO();
		
		adminQnA.setAdminQnATitle(request.getParameter("QnAType"));
		adminQnA.setAdminQnAContent(request.getParameter("QnAContent"));
		adminQnA.setMemberNo(userNo);
		
		int result = moreinfoService.insertAdminQnA(adminQnA);
		
		if(result > 0) {
			
			String page = "/WEB-INF/views/guest/moreNotice/narasuccess.jsp";
			request.setAttribute("successCode", "insertAdminQnA");
			request.getRequestDispatcher(page).forward(request, response);
			
		}
		
	}

}
