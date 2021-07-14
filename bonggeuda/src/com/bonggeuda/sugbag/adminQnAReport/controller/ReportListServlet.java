package com.bonggeuda.sugbag.adminQnAReport.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.adminNotice.dto.AdminNoticeDTO;
import com.bonggeuda.sugbag.adminNotice.service.AdminNoticeService;
import com.bonggeuda.sugbag.adminQnAReport.dto.ReportDTO;
import com.bonggeuda.sugbag.adminQnAReport.service.AdminReportService;
import com.bonggeuda.sugbag.common.paging.PageNation;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

/**
 * Servlet implementation class ReportListServlet
 */
@WebServlet("/report/list")
public class ReportListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		/* 전체 게시물 수가 필요 */
		/* 데이터베이스에서 먼저 전체 게시물 수를 조회 */
		AdminReportService adminReportservie = new AdminReportService();
		int totalCount = adminReportservie.selectReportTotalCount();
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		/* 조회 해온다. */
		List<ReportDTO> reportList = adminReportservie.selectReportList(pageInfo);
	
		String path = "";
		if(reportList != null) {
			path = "/WEB-INF/views/admin/report/report.jsp";
			request.setAttribute("reportList", reportList);
			request.setAttribute("pageInfo", pageInfo);
			System.out.println("리스트 확인" + reportList);
		} 
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	

}
