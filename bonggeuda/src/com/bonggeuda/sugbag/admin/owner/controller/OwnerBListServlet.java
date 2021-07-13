package com.bonggeuda.sugbag.admin.owner.controller;

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

import com.bonggeuda.sugbag.admin.owner.model.dto.BMemberDTO;
import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class OwnerBListServlet
 */
@WebServlet("/owner/blist")
public class OwnerBListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageNo = 1;
		
		String currentPage = request.getParameter("currentPage");
		
		if(currentPage != null && !currentPage.equals("")) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		AdminService service = new AdminService();
		BMemberDTO bMember = new BMemberDTO();
		List<BMemberDTO> bList = new ArrayList<BMemberDTO>();
		
		int totalCount = service.totalBlistCount();
		
		PageInfoDTO pageInfo = getPageInfo(pageNo, totalCount, 10, 5);
		
		bList = service.bListSelect(pageInfo);
		System.out.println(bList);
		
		String path = "";
		if(!bList.isEmpty()) {
			path = "/WEB-INF/views/admin/owner/ownerBlist.jsp";
			request.setAttribute("bList", bList);
			request.setAttribute("pageInfo", pageInfo);
		}
		request.getRequestDispatcher(path).forward(request, response);
	}


}
