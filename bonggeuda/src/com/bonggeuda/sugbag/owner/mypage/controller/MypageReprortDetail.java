package com.bonggeuda.sugbag.owner.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.ReportDTO;
import com.bonggeuda.sugbag.owner.mypage.service.OwnerMypagService;

/**
 * Servlet implementation class MypageReprortDetail
 */
@WebServlet("/owner/reportDetail")
public class MypageReprortDetail extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//DTO에 담자~
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		OwnerMypagService selctReportDetailService = new OwnerMypagService();
		
		ReportDTO reportDTO  = new ReportDTO();
		reportDTO = selctReportDetailService.selectReportDetail(reportNo);
		

		// 이미지 경로 조회
		String imagePath = selctReportDetailService.selectImagePath(reportNo);
		
		request.setAttribute("reportDTO",reportDTO );
		request.setAttribute("imagePath", imagePath);
		
		
		String path = "";
		path = "/WEB-INF/views/owner/mypage/mypageReportDetail.jsp";
		request.getAttribute(path);
		request.getRequestDispatcher(path).forward(request, response);

	}

}
