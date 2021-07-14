package com.bonggeuda.sugbag.owner.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.BookHistoryDTO;
import com.bonggeuda.sugbag.owner.book.service.BookListSelectService;
import com.bonggeuda.sugbag.sendMail.SMTPAuthenticatior;


/**
 * Servlet implementation class OwnerBookAllow
 */
@WebServlet("/owner/bookAllow")
public class OwnerBookAllow extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bookNo = Integer.parseInt(request.getParameter("bookNo")); 
		int bookAllow = 0;
		
		//이메일 보낼 주소 및 내용 가져오기
		String emailReceiver = request.getParameter("email");
		String bookDate = request.getParameter("bookRequestDate");
		String bookCheckInTime = request.getParameter("bookCheckInTime");
		String bookCheckoutDate = request.getParameter("bookCheckoutDate");
		String bookUserName = request.getParameter("bookUserName");
		String bookAccomoName = request.getParameter("accomoName");
		String bookRoomName = request.getParameter("roomName");
		
		BookListSelectService bookAllowService = new BookListSelectService();

		bookAllow = bookAllowService.bookAllowUpdate(bookNo);
		
		if(bookAllow > 0) {
			/* 승인 시 BookHistory 인서트 DTO에 담자. */
			int bookHistoryInsert = 0;
			
			BookListSelectService bookAllowHistoy = new BookListSelectService();
			
			bookHistoryInsert = bookAllowHistoy.insertBookHistory(bookNo);

			/* 메일 보내기*/
			SMTPAuthenticatior sendMail = new SMTPAuthenticatior();
			sendMail.sendAllowEmail(emailReceiver,bookDate,
					bookUserName,bookAccomoName,bookRoomName,bookCheckInTime ,bookCheckoutDate );
			
			String path = "";
			path = "/WEB-INF/views/owner/bookingList/bookAllowSuccessPage.jsp";
			request.getAttribute(path);
			request.getRequestDispatcher(path).forward(request, response);
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
