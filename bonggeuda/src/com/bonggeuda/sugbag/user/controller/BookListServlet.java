package com.bonggeuda.sugbag.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.common.paging.PageNation;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.user.dto.UserReservationStatusDTO;
import com.bonggeuda.sugbag.user.service.UserInfoService;

/**
 * 사용자 예약현황 리스트로 불러오는 서블릿
 * Servlet implementation class UserSelectBookListServlet
 */
@WebServlet("/user/booklist")
public class BookListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		/* 전체 게시물 수가 필요 */
		/* 데이터베이스에서 먼저 전체 게시물 수를 조회 */
		UserInfoService userInfoServie = new UserInfoService();
		int bookListCount = userInfoServie.selectbookCount();
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, bookListCount, limit, buttonAmount);
		
		System.out.println(pageInfo);
		
		/* 조회 해온다. */
		List<UserReservationStatusDTO> reservationList = userInfoServie.selectReservationList(pageInfo);
		
		String path = "";
		if(reservationList != null) {
			path = "/WEB-INF/views/admin/user/userReservation.jsp";
			request.setAttribute("reservationList", reservationList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("bookNo", request.getParameter("bookNo"));
		} 
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
