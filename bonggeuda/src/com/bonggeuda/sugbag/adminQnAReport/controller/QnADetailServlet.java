package com.bonggeuda.sugbag.adminQnAReport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.adminQnAReport.dto.QnADTO;
import com.bonggeuda.sugbag.adminQnAReport.service.AdminQnAService;

/**
 * Servlet implementation class QnADetailServlet
 */
@WebServlet("/qna/detail")
public class QnADetailServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminQnAService adminqnaService = new AdminQnAService();
		
		QnADTO qnaInfo = adminqnaService.selectqnaDetail(Integer.parseInt(request.getParameter("qnaNo")));
		
		String path = "";
		
		if(qnaInfo != null) {
			path = "/WEB-INF/views/admin/qna/qnaDetail.jsp";
			request.setAttribute("qnaInfo", qnaInfo);
			request.setAttribute("qnaNo", request.getParameter("qnaNo"));
		} 
		

		request.getRequestDispatcher(path).forward(request, response);
	}
}
