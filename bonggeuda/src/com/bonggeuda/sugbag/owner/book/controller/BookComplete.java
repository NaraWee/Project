package com.bonggeuda.sugbag.owner.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.owner.book.service.BookListSelectService;

/**
 * Servlet implementation class BookComplete
 */
@WebServlet("/owner/bookComplete")
public class BookComplete extends HttpServlet {

	/**
	 * 예약 확정후 결제 이력 인서트 및 예약 이력 인서트
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* 1. book history에 인서트*/
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
	
		BookListSelectService bookService = new BookListSelectService();
		
		int bookFin = 0;
		
		bookFin = bookService.bookFinUpdate(bookNo);
		
		if(bookFin > 0) {
			
			/* 2.sales history 인서트 */
			int accomoNo = Integer.parseInt(request.getParameter("accomoNo"));
			int roomNo = Integer.parseInt(request.getParameter("roomNo"));
			int paymentFee = Integer.parseInt(request.getParameter("paymentFee"));
			int paymentNo = Integer.parseInt(request.getParameter("paymentNo"));
			
			int result = bookService.insertSalesHistory(accomoNo,roomNo,paymentFee,paymentNo);
			
			/* 3. 지난 예약목록 리스트로 이동 */
			if(result > 0) {
				String path="";
				path = "/WEB-INF/views/owner/bookingList/bookFinish.jsp";
				request.getRequestDispatcher(path).forward(request, response);	
			}else {
				String path="";
				path = "/WEB-INF/views/owner/bookingList/bookFinishFail.jsp";
				request.getRequestDispatcher(path).forward(request, response);	
			}
		}
	}
}
