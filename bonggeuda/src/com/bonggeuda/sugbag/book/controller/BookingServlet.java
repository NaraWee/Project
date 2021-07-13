package com.bonggeuda.sugbag.book.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.CouponDTO;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.PointDTO;
import com.bonggeuda.sugbag.model.dto.RoomDTO;
import com.bonggeuda.sugbag.service.BookService;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/book/booking")
public class BookingServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//회원번호
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		int userNo = member.getUserNo();
		
		//기존 숙소정보
		AccomoInfoDTO accomoInfo = new AccomoInfoDTO();
		accomoInfo.setAccomoNo(Integer.parseInt(request.getParameter("accomoNo")));
		accomoInfo.setAccomoName(request.getParameter("accomoName"));
		String checkInStandard = request.getParameter("AccomoCheckIn");
		accomoInfo.setCheckIn(checkInStandard);
		
		//기존 객실정보
		
		RoomDTO roomInfo = new RoomDTO();
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		roomInfo = new BookService().selectRoomInfo(roomNo);
		
		// 예약정보
		BookDTO bookInfo = new BookDTO();
		String userCheckIN = request.getParameter("checkInTime");
		bookInfo.setUserNo(userNo);
		bookInfo.setBookPersonnel(Integer.parseInt(request.getParameter("people")));
		bookInfo.setBookCheckDate(request.getParameter("checkInDate"));
		bookInfo.setBookCheckoutDate(request.getParameter("checkOutDate"));
		bookInfo.setBookCheckIn(userCheckIN);
		Date checkOut = java.sql.Date.valueOf(request.getParameter("checkOutDate"));
		Date checkIn = java.sql.Date.valueOf(request.getParameter("checkInDate"));
		
		//결제금액 계산
		//숙소의 1박시간 계산
		int accomCheckInTime = Integer.parseInt(checkInStandard.substring(0, 2)); //숙소가 정한 체크인시간
		int OnedayTime = 0;
		if((11-accomCheckInTime)>0) {
			OnedayTime = accomCheckInTime-11;
		} else if((11-accomCheckInTime)<0) {
			OnedayTime = 24 - accomCheckInTime + 11;
		} else {
			OnedayTime = 24;
		}
		//이용시간 계산
		String checkInDate = request.getParameter("checkInDate") + " " + userCheckIN + ":00.0";;
		String checkOutDate = request.getParameter("checkOutDate") + " " + "11:00:00.0";
		java.sql.Timestamp userCheckInT = java.sql.Timestamp.valueOf(checkInDate);
		java.sql.Timestamp userCheckOutT = java.sql.Timestamp.valueOf(checkOutDate);
		//박수
		long useDay = ((userCheckOutT.getTime() - userCheckInT.getTime())/(OnedayTime*60*60*1000));
		Double useTimeCalc = (((userCheckOutT.getTime() - userCheckInT.getTime())/(OnedayTime*60*60*1000.0))*100)/100;
		Double useTime = Math.round(useTimeCalc* 100)/100.0;
		//이용금액 계산
		int totalPriceCalc = (int)(roomInfo.getRoomFee() * useTimeCalc);
		int totalPrice = (totalPriceCalc/100) * 100;
		bookInfo.setDay(useDay);
		
		List couponPoint = new BookService().selectCouponPoint(userNo);
		
		PointDTO point = null;
		List couponList = new ArrayList<>();

		for(int i = 0; i < couponPoint.size(); i++) {
			
			if(couponPoint.get(i) != null) {
				if(couponPoint.get(i) instanceof PointDTO)  {
					point = (PointDTO) couponPoint.get(i);
				} else if(couponPoint.get(i) instanceof CouponDTO) {
					CouponDTO coupon = (CouponDTO) couponPoint.get(i);
					Date today = new java.sql.Date(System.currentTimeMillis());
					int condition = Integer.parseInt(coupon.getCouponCondition());

					//1. 쿠폰시작일 <= 오늘날짜 <= 쿠폰종료일, 2.사용조건금액 <= 전체금액
					if(today.getDate()-coupon.getCouponStart().getDate() >= 0 && today.getDate()-coupon.getCouponEnd().getDate() <= 0 && condition <= totalPrice) {
						couponList.add(coupon);
					}
				}
			}
		}
		String path = "";
//		point.setPoint(0);
		if(accomoInfo != null && roomInfo != null && bookInfo != null) {
			
			path = "/WEB-INF/views/guest/accomoInfo/payment.jsp";
			request.setAttribute("accomoInfo", accomoInfo);
			request.setAttribute("roomInfo", roomInfo);
			request.setAttribute("bookInfo", bookInfo);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("couponList", couponList);
			request.setAttribute("point", point);
		} else {
//			System.out.println("에러페이지 갈 예정");
		}
		request.getRequestDispatcher(path).forward(request, response);;
	}
}
