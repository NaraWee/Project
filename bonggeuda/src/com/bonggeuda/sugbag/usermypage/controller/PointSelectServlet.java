package com.bonggeuda.sugbag.usermypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.common.paging.PageNation;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.PointDTO;
import com.bonggeuda.sugbag.model.dto.PointHistoryDTO;
import com.bonggeuda.sugbag.service.UserMypageService;

/**
 * Servlet implementation class PointSelectServlet
 */
@WebServlet("/point/select")
public class PointSelectServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		UserMypageService mypageService = new UserMypageService();
		
		/* 포인트 정보 조회 */		
		PointDTO pointDTO = mypageService.pointSelect(userNo);
		int point = pointDTO.getPoint();
		
		/* 포인트이력 정보 조회 */
		List<PointHistoryDTO> pointHistory2 = new ArrayList<>();
		pointHistory2 = mypageService.pointHistorySelect(userNo);
		
		
		
		/* 페이징처리 */
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
		int totalCount = pointHistory2.size();
		
		System.out.println("totalCount 체크 : " + totalCount);
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		System.out.println(pageInfo);
		
		
		
		
		/* 포인트이력 정보 조회 */
		List<PointHistoryDTO> pointHistory = mypageService.pointHistorySelect(userNo, pageInfo);

		
		String path = "";
		
		if(pointHistory != null && pointDTO != null) {
			path = "/WEB-INF/views/guest/mypage/point.jsp";
			request.setAttribute("point", point);
			request.setAttribute("pointHistory", pointHistory);
			request.setAttribute("totalCount", totalCount);
			request.setAttribute("pageInfo", pageInfo);
			
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
