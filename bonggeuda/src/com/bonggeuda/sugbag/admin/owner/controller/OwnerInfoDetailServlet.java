package com.bonggeuda.sugbag.admin.owner.controller;

import java.io.IOException;

import static com.bonggeuda.sugbag.common.paging.PageNation.getPageInfo;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;


import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.owner.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class OwnerInfoDetailServlet
 */
@WebServlet("/owner/detail")
public class OwnerInfoDetailServlet extends HttpServlet {
	static int OWNERNO = 0;
	static int ownerPageNo = 1;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ownerNo = request.getParameter("ownerNo");
		System.out.println(ownerNo);
		
		if(ownerNo != null && !ownerNo.equals("")) {
			int no = Integer.parseInt(ownerNo);
			if(OWNERNO != no) {
				OWNERNO = no;
			}
		}
		
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null && !currentPage.equals("")) {
			int pageNo =  Integer.parseInt(currentPage);
			if(ownerPageNo != pageNo) {
				ownerPageNo = pageNo;
			}
		}
		
		AdminService service = new AdminService();
		
		List<AccomoInfoDTO> accomoList = new ArrayList<AccomoInfoDTO>();
		// 처음만 1을 넘겨줌
		accomoList = service.ownerDetailInfo(OWNERNO);
		
		int totalCount = accomoList.size();
		
		PageInfoDTO pageInfo = getPageInfo(ownerPageNo, totalCount, 1, 5);
		
		AccomoInfoDTO accomoInfo = accomoList.get(ownerPageNo - 1); 
		
		String path = "";
		if(accomoList != null) {
			path = "/WEB-INF/views/admin/owner/ownerInfoDetail.jsp";
			request.setAttribute("accomoInfo", accomoInfo);
			request.setAttribute("pageInfo", pageInfo);
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
