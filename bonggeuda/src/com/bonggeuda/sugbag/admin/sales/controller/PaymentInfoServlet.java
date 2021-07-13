package com.bonggeuda.sugbag.admin.sales.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.sales.model.dto.PaymentDTO;
import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class PaymentInfoServlet
 */
@WebServlet("/sales/payinfo")
public class PaymentInfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int paymentNo = Integer.parseInt(request.getParameter("paymentNo"));
		
		AdminService service = new AdminService();
		
		PaymentDTO pay = new PaymentDTO();
		
		pay = service.payInfo(paymentNo);
		
		String query = "";
		
		if(pay != null) {
			query = "/WEB-INF/views/admin/sales/paymentInfo.jsp";
			request.setAttribute("pay", pay);
		}
		request.getRequestDispatcher(query).forward(request, response);
	}

}
