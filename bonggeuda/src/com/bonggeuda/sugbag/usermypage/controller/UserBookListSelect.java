package com.bonggeuda.sugbag.usermypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.service.UserMypageService;

/**
 * Servlet implementation class UserBookListSelect
 */
@WebServlet("/userbooklist/select")
public class UserBookListSelect extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		
		UserMypageService mypageService = new UserMypageService();
		
		/* 예약한 목록 조회하기 */
		List<BookDTO> booklist = new ArrayList<>();
		booklist = mypageService.selectUserBookList(userNo);
		System.out.println(booklist);
		
		/* 이용 완료한 목록 조회하기 */
		List<BookDTO> completeBooklist = new ArrayList<>();
		completeBooklist = mypageService.selectCompleteBooklist(userNo);
		System.out.println(completeBooklist);
		
		/* 예약 취소한 목록 조회하기 */
		List<BookDTO> cancleBooklist = new ArrayList<>();
		cancleBooklist = mypageService.selectCancleBooklist(userNo);
		System.out.println(cancleBooklist);

		
		
		String path = "/WEB-INF/views/guest/mypage/reservation.jsp";
		request.setAttribute("booklist", booklist);
		request.setAttribute("completeBooklist", completeBooklist);
		request.setAttribute("cancleBooklist", cancleBooklist);
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
