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
import com.bonggeuda.sugbag.model.dto.ReportDTO;
import com.bonggeuda.sugbag.service.UserMypageService;

/**
 * Servlet implementation class UserReportListSelect
 */
@WebServlet("/userreportlist/select")
public class UserReportListSelect extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		
		UserMypageService mypageService = new UserMypageService();
		
		List<ReportDTO> userreportList2 = new ArrayList<>();
		userreportList2 = mypageService.selectReportList(userNo);
		
		
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
		int totalCount = userreportList2.size();
		
		System.out.println("totalCount 체크 : " + totalCount);
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		System.out.println(pageInfo);
		
		/* 신고리스트 불러오기 */
		List<ReportDTO> userreportList = mypageService.selectReportList(userNo, pageInfo);
		
		String path = "/WEB-INF/views/guest/mypage/warningList.jsp";
		request.setAttribute("userreportList", userreportList);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageInfo", pageInfo);
		
		request.getRequestDispatcher(path).forward(request, response);
	
	}

}
