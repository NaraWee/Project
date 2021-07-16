package com.bonggeuda.sugbag.admin.sales.controller;

import java.io.IOException;

import static com.bonggeuda.sugbag.common.paging.PageNation.getPageInfo;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

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
@WebServlet("/sales/paylist")
public class PaymentListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageNo = 1;
		
		String currentPage = request.getParameter("currentPage");
		
		if(currentPage != null && !currentPage.equals("")) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		List<PaymentDTO> payList = new ArrayList<PaymentDTO>();
		
		AdminService service = new AdminService();
		
		int totalPayCount = service.totalPayCount();
		
		PageInfoDTO pageInfo = getPageInfo(pageNo, totalPayCount, 10, 5);
		
		payList = service.payList(pageInfo);
		
		String path = "";
		if(payList != null) {
			path = "/WEB-INF/views/admin/sales/paymentList.jsp";
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("payList", payList);
		}
		request.getRequestDispatcher(path).forward(request, response);
	}


}
