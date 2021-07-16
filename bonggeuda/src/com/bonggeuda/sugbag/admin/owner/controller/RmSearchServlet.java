package com.bonggeuda.sugbag.admin.owner.controller;

import java.io.IOException;


import static com.bonggeuda.sugbag.common.paging.PageNation.getPageInfo;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.service.AdminService;


/**
 * Servlet implementation class RmAccomoSearchServlet
 */
@WebServlet("/owner/rmsearch")
public class RmSearchServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String searchValue = request.getParameter("searchValue");
		
		AdminService service = new AdminService();
		
//		int totalCount = service.rmTotalCount(searchValue); 
		
//		PageInfoDTO pageinfo = getPageInfo(1, totalCount, 5, 5);
		
		
		
	}

}
