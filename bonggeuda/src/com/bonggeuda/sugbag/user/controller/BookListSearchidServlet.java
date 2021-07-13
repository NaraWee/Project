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
 * Servlet implementation class SearchidBooklistServlet
 */
@WebServlet("/searchid/booklist")
public class BookListSearchidServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String condition = request.getParameter("searchCondition");
		String value = request.getParameter("searchValue");

		/* 목록보기를 눌렀을 시 가장 처음에 보여지는 페이지는 1페이지이다.
		 * 파라미터로 전달되는 페이지가 있는 경우 currentPage는 파라미터로 전달받은 페이지 수 이다.
		 * */
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		/* 0보다 작은 숫자값을 입력해도 1페이지를 보여준다 */
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		/* 전체 게시물 수가 필요하다.
		 * 데이터베이스에서 먼저 전체 게시물 수를 조회해올 것이다.
		 * */
		/* 데이터베이스에서 먼저 전체 게시물 수를 조회 */
		UserInfoService userInfoServie = new UserInfoService();;
		int bookCount = userInfoServie.searchBookCount(condition, value);
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;		//얘도 파라미터로 전달받아도 된다.
		/* 한 번에 보여질 페이징 버튼의 갯수 */
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, bookCount, limit, buttonAmount);
		
		/* 조회해온다 */
		List<UserReservationStatusDTO> reservationList = userInfoServie.selectSearchIdList(condition, value, pageInfo);

		
		String path = "";
		if(reservationList != null) {
			path = "/WEB-INF/views/admin/user/userReservation.jsp";
			request.setAttribute("reservationList", reservationList);
			request.setAttribute("pageInfo", pageInfo);
			
		} 
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
