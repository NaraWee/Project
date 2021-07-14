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
import com.bonggeuda.sugbag.user.dto.BestReviewDTO;
import com.bonggeuda.sugbag.user.service.UserInfoService;

/**
 * Servlet implementation class BestReviewServlet
 */
@WebServlet("/best/review")
public class BestReviewServlet extends HttpServlet {

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
		int bestReviewCount = userInfoServie.selectBestReviewCount();
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, bestReviewCount, limit, buttonAmount);
		
		/* 조회 해온다. */
		List<BestReviewDTO> bestReviewList = userInfoServie.selectBestReviewList(pageInfo);

		
		String path = "";
		if(bestReviewList != null) {
			path = "/WEB-INF/views/admin/user/bestReview.jsp";
			request.setAttribute("bestReviewList", bestReviewList);
			request.setAttribute("pageInfo", pageInfo);
		} 
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
