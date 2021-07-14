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
import com.bonggeuda.sugbag.admin.service.AdminService;



/**
 * Servlet implementation class PaymentListServlet
 */
@WebServlet("/sales/canclelist")
public class CancleListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageNo = 1;
		
		String refundStatus = "N";
		
		String currentPage = request.getParameter("currentPage");
		
		String refund = request.getParameter("refundStatus");
		
		if(refund != null && !refund.equals("")) {
			refundStatus = refund;
		}
		
		if(currentPage != null && !currentPage.equals("")) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		List<PaymentDTO> cancleList = new ArrayList<PaymentDTO>();
		
		AdminService service = new AdminService();
		
		int totalCancleCount = service.totalCancleCount(refundStatus);
		
		PageInfoDTO pageInfo = getPageInfo(pageNo, totalCancleCount, 5, 5);
		
		cancleList = service.cancleList(pageInfo, refundStatus);
		
		String path = "";
		if(cancleList != null) {
			path = "/WEB-INF/views/admin/sales/cancleList.jsp";
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("cancleList", cancleList);
			request.setAttribute("refundStatus", refundStatus);
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
