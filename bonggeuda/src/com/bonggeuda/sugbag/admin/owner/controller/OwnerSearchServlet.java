package com.bonggeuda.sugbag.admin.owner.controller;

import java.io.IOException;

import static com.bonggeuda.sugbag.common.paging.PageNation.getPageInfo;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.owner.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class OwnerListSearchServlet
 */
@WebServlet("/owner/search")
public class OwnerSearchServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchValue = request.getParameter("searchValue");
		
//		String currentPage = request.getParameter("currentPage");
		
		PageInfoDTO pageInfo = getPageInfo(1, 1, 5, 5);
		
		AdminService service = new AdminService();
		
		OwnerInfoDTO searchOwner = new OwnerInfoDTO();
		
		searchOwner = service.ownerSearch(searchValue);
		
		String path = "";
		if(searchOwner != null) {
			path = "/WEB-INF/views/admin/owner/ownerList.jsp";
			System.out.println("ppppath" + path);
			request.setAttribute("searchOwner", searchOwner);
			request.setAttribute("pageInfo", pageInfo);
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
