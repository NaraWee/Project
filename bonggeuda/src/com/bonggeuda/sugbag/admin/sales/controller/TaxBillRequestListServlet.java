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
import com.bonggeuda.sugbag.admin.sales.model.dto.RequestDTO;

import com.bonggeuda.sugbag.admin.service.*;

/**
 * Servlet implementation class StlRequestListServlet
 */
@WebServlet("/sales/taxrequest")
public class TaxBillRequestListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageNo = 1;
		
		String taxStatus = "N";
		
		String currentPage = request.getParameter("currentPage");
		
		String tax = request.getParameter("taxStatus");
		
		if(tax != null && !tax.equals("")) {
			taxStatus = tax;
		}
		
		if(currentPage != null && !currentPage.equals("")) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		List<RequestDTO> requestTaxList = new ArrayList<RequestDTO>();
		
		AdminService service = new AdminService();
		
		int requestCount = service.totalTaxRequestCount(taxStatus);
		
		PageInfoDTO pageInfo = getPageInfo(pageNo, requestCount, 5, 5);
		
		requestTaxList = service.requestTaxList(pageInfo, taxStatus);
		
		String path = "";
		if(requestTaxList != null) {
			path = "/WEB-INF/views/admin/sales/taxBillRequestList.jsp";
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("requestTaxList", requestTaxList);
			request.setAttribute("taxStatus", taxStatus);
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
