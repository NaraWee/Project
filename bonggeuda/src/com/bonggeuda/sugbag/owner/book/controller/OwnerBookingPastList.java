package com.bonggeuda.sugbag.owner.book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.common.paging.PageNation;
import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.BookingContentDTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.owner.book.service.BookListSelectService;
import com.bonggeuda.sugbag.owner.notice.service.QuestionService;

/**
 * Servlet implementation class OwnerBookingPastList
 */
@WebServlet("/owner/bookingPastList")
public class OwnerBookingPastList extends HttpServlet {

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
		BookListSelectService BookListService = new BookListSelectService();
		
		//로그인 값
		HttpSession session = request.getSession();
		int ownerNo = (Integer)session.getAttribute("ownerNo");
		
		int totalCount = BookListService.selectTotalCount(ownerNo);
		

		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);

		
		List<BookDTO> bookList = BookListService.bookPastListSelect(pageInfo, ownerNo);
		
		
		String path = "";
		path = "/WEB-INF/views/owner/bookingList/bookingPast.jsp";
		request.setAttribute("bookList", bookList);
		request.setAttribute("pageInfo", pageInfo);
		
		request.getRequestDispatcher(path).forward(request, response);
	}


	/**
	 * 예약 지난내역에서 상세정보 보는 페이지로 이동
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BookListSelectService bookService = new BookListSelectService();
		/* 1. BookNO 가져오기 */
		int bookNo = Integer.parseInt(request.getParameter("bookNo")); 
		String bookStatusYNC = request.getParameter("bookStatusYNC");
		
		BookingContentDTO bookContentDTO = new BookingContentDTO();
		


		bookContentDTO = bookService.selectBookContent(bookNo);
		/* 2. 페이넘 넘겨 받아서 세일즈 히스토리에 있는지 여부. 있으면 숙소 이용완료 확정*/
		int completeCount = bookService.selectcompleteCount(bookNo);

		
		request.setAttribute("completeCount", completeCount);
		request.setAttribute("bookStatusYNC",bookStatusYNC );

		request.setAttribute("bookContentDTO", bookContentDTO );
		String path = "";
		path = "/WEB-INF/views/owner/bookingList/bookingPastContent.jsp";
		request.getAttribute(path);
		request.getRequestDispatcher(path).forward(request, response);
	}

}
