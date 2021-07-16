package com.bonggeuda.sugbag.admin.sales.controller;

import static com.bonggeuda.sugbag.common.paging.PageNation.getPageInfo;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.sales.model.dto.PaymentDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.SettlementDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.StlPerDTO;
import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class MonthStlListServlet
 */
@WebServlet("/sales/stlinfo")
public class SettlementInfoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int accomoNo = Integer.parseInt(request.getParameter("accomoNo"));

		// 정산 완료 리스트
		List<SettlementDTO> stlList = new ArrayList<SettlementDTO>();

		int pageNo1 = 1;

		String currentPage1 = request.getParameter("currentPage1");

		if (currentPage1 != null && !currentPage1.equals("")) {
			pageNo1 = Integer.parseInt(currentPage1);
		}

		AdminService service = new AdminService();

		int totalStlCount = service.totalStlCount(accomoNo);

		PageInfoDTO pageInfo1 = getPageInfo(pageNo1, totalStlCount, 7, 5);

		stlList = service.monthStlList(pageInfo1, accomoNo);

		// 미정산 매출 건별 리스트
		List<StlPerDTO> prePerList = new ArrayList<StlPerDTO>();

		int totalPreCount = service.totalPerCount(accomoNo, "N");
		int pageNo2 = 1;

		String currentPage2 = request.getParameter("currentPage2");

		if (currentPage2 != null && !currentPage2.equals("")) {
			pageNo2 = Integer.parseInt(currentPage2);
		}

		PageInfoDTO pageInfo2 = getPageInfo(pageNo2, totalPreCount, 7, 5);

		prePerList = service.prePerList(accomoNo, pageInfo2);

		// 정산완료 매출건별 리스트
		int pageNo3 = 1;
		
		List<StlPerDTO> stlPerList = new ArrayList<StlPerDTO>();

		String currentPage3 = request.getParameter("currentPage3");

		if (currentPage3 != null && !currentPage3.equals("")) {
			pageNo3 = Integer.parseInt(currentPage3);
		}
		
		int totalStlPerCount = service.stlPerCount(accomoNo);
		
		PageInfoDTO pageInfo3 = getPageInfo(pageNo3, totalStlPerCount, 7, 5);
		
		stlPerList = service.stlPerList(accomoNo, pageInfo3);

		String path = "";
		if (stlList != null) {
			path = "/WEB-INF/views/admin/sales/settlement.jsp";
			request.setAttribute("pageInfo1", pageInfo1);
			request.setAttribute("pageInfo2", pageInfo2);
			request.setAttribute("pageInfo3", pageInfo3);
			request.setAttribute("stlList", stlList);
			request.setAttribute("prePerList", prePerList);
			request.setAttribute("stlPerList", stlPerList);
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
