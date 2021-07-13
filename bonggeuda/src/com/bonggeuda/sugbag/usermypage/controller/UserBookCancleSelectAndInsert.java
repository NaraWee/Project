package com.bonggeuda.sugbag.usermypage.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.UserBookContentDTO;
import com.bonggeuda.sugbag.service.UserMoreInfoService;
import com.bonggeuda.sugbag.service.UserMypageService;

/**
 * Servlet implementation class UserBookCancleSelectAndInsert
 */
@WebServlet("/userbookcancle/selectandinsert")
public class UserBookCancleSelectAndInsert extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
				
		UserMypageService mypageService = new UserMypageService();
		
		UserBookContentDTO userBookCancle = mypageService.selectBookCancle(userNo, bookNo);
		
		
		String path = "/WEB-INF/views/guest/mypage/reservationCancel.jsp";
		request.setAttribute("userBookCancle", userBookCancle);
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		
		request.setCharacterEncoding("UTF-8");
		
		UserMypageService mypageService = new UserMypageService();
		
		/* 예약 취소 사유 insert & 예약내역 update & 판매내역 insert */
		UserBookContentDTO userCancelReason = new UserBookContentDTO();
		
		userCancelReason.setReasonCancle(request.getParameter("cancelReason") + " : " + request.getParameter("cancelReasonTwo"));
		userCancelReason.setPaymentNo(Integer.parseInt(request.getParameter("paymentNo")));
		userCancelReason.setRefundAmount(Integer.parseInt(request.getParameter("refundAmount")));
		userCancelReason.setPaymentAmount(Integer.parseInt(request.getParameter("paymentAmount")));
		userCancelReason.setAccomoNo(Integer.parseInt(request.getParameter("accomoNo")));
		userCancelReason.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		userCancelReason.setPaymentTime(Date.valueOf(request.getParameter("paymentTime")));
		userCancelReason.setCancleFee(Integer.parseInt(request.getParameter("cancleFee")));
		
		System.out.println("확인 : " + userCancelReason);
		
		int result = mypageService.insertCancel(userCancelReason, userNo, bookNo);
		
		System.out.println(result);
		
		
		if(result > 2) {
			
			String page = "/WEB-INF/views/guest/moreNotice/narasuccess.jsp";
			request.setAttribute("successCode", "insertCancel");
			request.getRequestDispatcher(page).forward(request, response);
			
		}
	}

}
