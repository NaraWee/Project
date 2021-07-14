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
 * Servlet implementation class CancleInfoServlet
 */
@WebServlet("/sales/cancleinfo")
public class CancleInfoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cancleNo = Integer.parseInt(request.getParameter("cancleNo"));

		AdminService service = new AdminService();

		PaymentDTO cancle = new PaymentDTO();

		cancle = service.cancleInfo(cancleNo);

		String query = "";

		if (cancle != null) {
			query = "/WEB-INF/views/admin/sales/cancleInfo.jsp";
			request.setAttribute("cancle", cancle);
		}
		request.getRequestDispatcher(query).forward(request, response);
	}

}
