package com.bonggeuda.sugbag.owner.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.AccomoDTO;
import com.bonggeuda.sugbag.owner.mypage.service.OwnerMypagService;

/**
 * Servlet implementation class TaxBillRequest
 */
@WebServlet("/owner/requestTaxBill")
public class TaxBillRequest extends HttpServlet {

	/**
	 * 세금계산서 발급페이지 (숙소 이름 셀렉기능 추가)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int stlNo = Integer.parseInt(request.getParameter("reqStlNo"));
		int accomoNo = Integer.parseInt(request.getParameter("accomoNo"));
		
		System.out.println(stlNo);
		System.out.println(accomoNo);
		
		OwnerMypagService ownerService = new OwnerMypagService();
		
		int reqTaxBill = ownerService.insertRequestTaxBill(stlNo,accomoNo);
		
		request.setAttribute("reqTaxBill", reqTaxBill);
		
		System.out.println(reqTaxBill);
		
		String path = "";
		if(reqTaxBill > 0) {
			path = "/WEB-INF/views/owner/mypage/requestTaxBillSuccess.jsp";
			request.getAttribute(path);
			request.getRequestDispatcher(path).forward(request, response);
			
		}else {
			path = "/WEB-INF/views/owner/mypage/requestTaxBillFail.jsp";
			request.getAttribute(path);
			request.getRequestDispatcher(path).forward(request, response);
		}
	}
}
