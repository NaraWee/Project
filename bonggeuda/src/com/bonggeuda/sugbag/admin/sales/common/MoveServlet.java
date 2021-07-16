package com.bonggeuda.sugbag.admin.sales.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class MoveServlet
 */
@WebServlet("/admin/move")
public class MoveServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String successCode = request.getParameter("successCode");
		request.setAttribute("successCode", successCode);
		request.getRequestDispatcher("/WEB-INF/views/admin/common/success.jsp").forward(request, response);
	}

}
