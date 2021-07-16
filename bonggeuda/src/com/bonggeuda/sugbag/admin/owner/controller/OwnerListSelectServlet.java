package com.bonggeuda.sugbag.admin.owner.controller;

import java.io.IOException;

import static com.bonggeuda.sugbag.common.paging.PageNation.getPageInfo;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.owner.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.admin.service.AdminService;
import com.google.gson.Gson;


/**
 * Servlet implementation class OwnerListSelectServlet
 */
@WebServlet("/owner/list")
public class OwnerListSelectServlet extends HttpServlet {
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currentPage = request.getParameter("currentPage");
		
		AdminService service = new AdminService();
		
		int pageNo = 1;
		
		if(currentPage != null && !currentPage.equals("")) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		int limit = 10;
		
		int buttonAmount = 5;
		
		int totalCount = service.selectTotalCount();
		
		PageInfoDTO pageInfo = getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		List<OwnerInfoDTO> ownerList = new ArrayList<OwnerInfoDTO>();
		
		ownerList = service.ownerListSelect(pageInfo);
		
		String path = "";
		if(ownerList != null) {
			
			path = "/WEB-INF/views/admin/owner/ownerList.jsp";
			request.setAttribute("ownerList", ownerList);
			request.setAttribute("pageInfo", pageInfo);
			
		}
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
