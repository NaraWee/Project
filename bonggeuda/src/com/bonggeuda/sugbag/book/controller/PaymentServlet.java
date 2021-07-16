package com.bonggeuda.sugbag.book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.CouponHistoryDTO;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.PaymentDTO;
import com.bonggeuda.sugbag.model.dto.PointHistoryDTO;
import com.bonggeuda.sugbag.service.BookService;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/book/payment")
public class PaymentServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int couponNo = Integer.parseInt(request.getParameter("coupon"));
		
		int discount = new BookService().selectDiscountAmount(couponNo);
		
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(discount);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//예약자번호
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		int userNo = member.getUserNo();
		
		//예약정보
		BookDTO bookInfo = new BookDTO();
		bookInfo.setUserNo(userNo);
		bookInfo.setBookUserName(request.getParameter("bookName"));
		bookInfo.setBookPersonnel(Integer.parseInt(request.getParameter("personnel")));
		bookInfo.setBookCheckDate(request.getParameter("checkInDate"));
		bookInfo.setBookCheckoutDate(request.getParameter("checkOutDate"));
		bookInfo.setBookCheckIn(request.getParameter("checkInTime"));
		bookInfo.setUserPhone(request.getParameter("phone"));
		bookInfo.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		bookInfo.setRequest(request.getParameter("request"));
		
		BookService bsvc = new BookService();
		
		//결제정보
		int amount = Integer.parseInt(request.getParameter("finalPrice")); //결제금액
		int point = 0; //포인트 사용금액
		if(request.getParameter("point").length() > 0) {
			point = Integer.parseInt(request.getParameter("point")); 
			
		}
		int coupon=0;//쿠폰사용금액
		if(request.getParameter("couponDiscount").length()>0){
			coupon = Integer.parseInt(request.getParameter("couponDiscount")); 
		}
		
		PaymentDTO payment = new PaymentDTO();
		payment.setMethod(request.getParameter("paymentType"));
		payment.setAmount(Integer.parseInt(request.getParameter("finalPrice")));
		payment.setCouponYN("N");
		payment.setPointYN("N");
		payment.setPaymentTime(new Date(System.currentTimeMillis()));
		int discount = 0;
		
		if(point>0) {
			payment.setPointYN("Y");
			discount += point;
		}
		
		if(coupon>0) {
			payment.setCouponYN("Y");
			discount += coupon;
		}
		payment.setDiscount(discount);
		
		int pointNo = Integer.parseInt(request.getParameter("pointNo"));
		
		PointHistoryDTO pointGet = new PointHistoryDTO();
		pointGet.setGetuseType("G");
		
		int getPoint = (int)(amount * 0.01);//결제금액의 3% 적립
		getPoint = ((int) Math.ceil(getPoint*0.1)) * 10; 
		pointGet.setPoint(getPoint);
		pointGet.setPointPath("숙소결제완료");
		pointGet.setGuDate(payment.getPaymentTime());
		pointGet.setPointNo(pointNo);
		
		
		//예약정보INSERT
		
		//쿠폰 사용시 쿠폰이력 생성
		CouponHistoryDTO couponUse = new CouponHistoryDTO();
		if(payment.getCouponYN().equals("Y")) {
			int couponNo = Integer.parseInt(request.getParameter("couponNo"));
			couponUse.setCouponNo(couponNo);
			couponUse.setUseDate(payment.getPaymentTime());
		}
	
//		포인트 사용시 포인트이력생성
		PointHistoryDTO pointUse = new PointHistoryDTO();
		if(payment.getPointYN().equals("Y")) {
			pointUse.setGetuseType("U");
			pointUse.setPoint(point);
			pointUse.setGuDate(payment.getPaymentTime());
			pointUse.setPointPath("포인트로결제");
			pointUse.setPointNo(pointNo);
			
		}
		
		int result = bsvc.insertBookNpay(bookInfo, payment, pointGet, couponUse, pointUse);
		
		String path ="";
		if(result > 0) {
			path = "/userbooklist/select";
		}
		
//		response.sendRedirect(request.getContextPath() + path);
		
	}
}
