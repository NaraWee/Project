package com.bonggeuda.sugbag.owner.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.owner.book.service.BookListSelectService;
import com.bonggeuda.sugbag.sendMail.SMTPAuthenticatior;

/**
 * Servlet implementation class OwnerBookReject
 */
@WebServlet("/owner/bookReject")
public class OwnerBookReject extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BookListSelectService bookRejectService = new BookListSelectService();
		
		int bookNo = Integer.parseInt(request.getParameter("bookNo")); 
		
		String rejecetReason = request.getParameter("rejectReson");/* 거절 사유 */
		
		//이메일 보낼 주소 및 내용 가져오기
		String emailReceiver = request.getParameter("email");
		String bookDate = request.getParameter("bookRequestDate");
		String bookCheckInTime = request.getParameter("bookCheckInTime");
		String bookCheckoutDate = request.getParameter("bookCheckoutDate");
		String bookUserName = request.getParameter("bookUserName");
		String bookAccomoName = request.getParameter("accomoName");
		String bookRoomName = request.getParameter("roomName");
		 
		int bookReject = 0;
		int bookRejectBookConfirm = 0;
		bookReject = bookRejectService.bookRejectUpdate(bookNo); 
		bookRejectBookConfirm = bookRejectService.bookRejectBookConfirmUpdate(bookNo);

		if(bookReject > 0 && bookRejectBookConfirm > 0) {
			
			int bookRejectHistory = 0;
			
			bookRejectHistory = bookRejectService.bookRejectHistoryInsert(bookNo,rejecetReason);
			
			/* 메일 보내기*/
			SMTPAuthenticatior sendMail = new SMTPAuthenticatior();
			sendMail.sendRejectMail(emailReceiver,bookDate,
					bookUserName,bookAccomoName,bookRoomName,bookCheckInTime ,bookCheckoutDate,rejecetReason);
		
			String path = "";
			path = "/WEB-INF/views/owner/bookingList/bookRejectPage.jsp";
			request.getAttribute(path);
			request.getRequestDispatcher(path).forward(request, response);
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
