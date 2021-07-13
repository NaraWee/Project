package com.bonggeuda.sugbag.admin.sales.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.sales.model.dto.TaxBillDTO;
import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class TaxBillInfoServlet
 */
@WebServlet("/sales/taxbillinfo")
public class TaxBillInfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int stlNo = Integer.parseInt(request.getParameter("stlNo"));
		
		int requestNo = Integer.parseInt(request.getParameter("requestNo"));
		
		String taxStatus = request.getParameter("taxStatus");
		
		System.out.println("taxStatus : " + taxStatus);
		
		AdminService service = new AdminService();
		
		TaxBillDTO taxBill = new TaxBillDTO();
		
		taxBill = service.taxBillInfo(stlNo);
		taxBill.setRequestNo(requestNo);

		String path = "";
		if(taxBill != null) {
			path = "/WEB-INF/views/admin/sales/taxBill.jsp" ;
			request.setAttribute("taxBill", taxBill);
			request.setAttribute("taxStatus", taxStatus);
		}
		request.getRequestDispatcher(path).forward(request, response);
	}


}
