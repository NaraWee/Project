package com.bonggeuda.sugbag.usermoreinfo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.OwnerQnADTO;
import com.bonggeuda.sugbag.service.UserMoreInfoService;

/**
 * Servlet implementation class UserQnAContentSelect
 */
@WebServlet("/userqnacontent/select")
public class UserQnAContentSelect extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		String writer = request.getParameter("qnaWriter");
		
		UserMoreInfoService moreinfoService = new UserMoreInfoService();
		
		if(writer.equals("관리자")) {
			/* 관리자에게 문의리스트 조회 */
			AdminQnADTO adminQnA = new AdminQnADTO();
			adminQnA = moreinfoService.selectAdminQnA(userNo, qnaNo);
			request.setAttribute("adminQnA", adminQnA);
			
		} else {
			/* 업체에게 문의리스트 조회 */
			OwnerQnADTO ownerQnA = new OwnerQnADTO();
			ownerQnA = moreinfoService.selectOwnerQnA(userNo, qnaNo);
			request.setAttribute("ownerQnA", ownerQnA);
		}
		
		String path = "/WEB-INF/views/guest/moreNotice/QnA_contents.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
