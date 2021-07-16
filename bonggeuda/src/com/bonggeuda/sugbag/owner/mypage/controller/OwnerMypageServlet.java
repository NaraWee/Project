package com.bonggeuda.sugbag.owner.mypage.controller;

import java.io.IOException;
import java.sql.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.owner.mypage.service.OwnerMypagService;

/**
 * Servlet implementation class OwnerMypage
 */
@WebServlet("/owner/mypage")
public class OwnerMypageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    HttpSession session = request.getSession();
	    int ownerNo = (Integer)session.getAttribute("ownerNo");
	    
		OwnerMypagService ownerMypageService = new OwnerMypagService();
		
		OwnerInfoDTO selectOwner = ownerMypageService.selectOwnerInfo(ownerNo);
		
		/* 신고 당한 횟수 조회 */
		int reportedCount = ownerMypageService.selectreportedCount(ownerNo);
	
		
		
		/* 비지니스 로직 실행 결과에 따른 로직*/
		String path = "";
		if(selectOwner != null) {
			request.setAttribute("reportedCount", reportedCount);
			request.setAttribute("selectOwner",selectOwner);
			path = "/WEB-INF/views/owner/mypage/mypage.jsp";
			request.getAttribute(path);
			
			request.getRequestDispatcher(path).forward(request, response);
		}
		
		
		
		


	}

}
