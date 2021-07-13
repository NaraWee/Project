package com.bonggeuda.sugbag.admin.sales.controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import static com.bonggeuda.sugbag.common.paging.PageNation.getPageInfo;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class SettlementServlet
 */
@WebServlet("/sales/stl")
public class SettlementServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int accomoNo = Integer.parseInt(request.getParameter("accomoNo"));
		
		AdminService service = new AdminService();
		
		String status = request.getParameter("status");
				
		int insertStlCount = 0;
		
		// STL insert
		insertStlCount = service.insertStl(accomoNo);
		
		// salesNo select
		List<Integer> salesNoList = new ArrayList<Integer>();
		salesNoList = service.salesNoList(accomoNo);
		
		// salesHistory update
		int updateSalesHistoryCount = 0;
		updateSalesHistoryCount = service.updateSalesHistory(accomoNo);
		
		// stlHistory insert
		int insertStlHistoryCount = 0;
		insertStlHistoryCount = service.insertStlHistory(salesNoList);
		
		int totalCount = 1 + (salesNoList.size() * 2);
		
		int updateRequestList = service.updateRequestList(accomoNo);
		
		String path = "";
		if(totalCount == insertStlHistoryCount + updateSalesHistoryCount + insertStlCount) {
			path = "/WEB-INF/views/admin/common/success.jsp";
			request.setAttribute("successCode", "stl");
			request.setAttribute("accomoNo", accomoNo);
			
			
		}
        request.getRequestDispatcher(path).forward(request, response);
		
		
	}


}





//정산 요청시 정산건이 없으나 요청이 왔을경우 처리할것
//if(status.equals("Y")) {
//	// requestList update
//	int updateRequestListCount = 0;
//	
//	updateRequestListCount = service.updateRequestList(accomoNo);
//	
//	String path = "";
//	
//	if(updateRequestListCount >= 1) {
//		path = "/WEB-INF/views/admin/common/success.jsp";
//		request.setAttribute("successCode", "stlRequestYn");
//		request.setAttribute("accomoNo", accomoNo);
//		
//		
//	}
//    request.getRequestDispatcher(path).forward(request, response);
//	
//	
//}

//int intAccomoNo = 0;
//if(accomoNo != null && !accomoNo.equals("")) {
	
//	int intAaccomoNo = Integer.parseInt(request.getParameter("accomoNo"));
//}
