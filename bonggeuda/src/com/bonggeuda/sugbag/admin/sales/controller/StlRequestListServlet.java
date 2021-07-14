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
import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class StlRequestListServlet
 */
@WebServlet("/sales/stlrequest")
public class StlRequestListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageNo = 1;
		
		String stlStatus = "N";
		
		String currentPage = request.getParameter("currentPage");
		
		String stl = request.getParameter("stlStatus");
		
		if(stl != null && !stl.equals("")) {
			stlStatus = stl;
		}
		
		if(currentPage != null && !currentPage.equals("")) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		List<RequestDTO> requestList = new ArrayList<RequestDTO>();
		
		AdminService service = new AdminService();
		
		int requestCount = service.totalRequestCount(stlStatus);
		
		PageInfoDTO pageInfo = getPageInfo(pageNo, requestCount, 5, 5);
		
		requestList = service.requestList(pageInfo, stlStatus);
		
		String path = "";
		if(requestList != null) {
			path = "/WEB-INF/views/admin/sales/stlRequestList.jsp";
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("requestList", requestList);
			request.setAttribute("stlStatus", stlStatus);
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
