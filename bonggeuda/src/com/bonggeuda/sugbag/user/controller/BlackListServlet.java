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
import com.bonggeuda.sugbag.user.dto.UserBlistDTO;
import com.bonggeuda.sugbag.user.dto.UserInfoDTO;
import com.bonggeuda.sugbag.user.service.UserInfoService;

/**
 * Servlet implementation class BlackListServlet
 */
@WebServlet("/black/list")
public class BlackListServlet extends HttpServlet {
	
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
		UserInfoService userInfoService = new UserInfoService();
		int blackCount = userInfoService.selectblackCount();
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, blackCount, limit, buttonAmount);

		
		/* 조회 해온다. */
		List<UserBlistDTO> blackList = userInfoService.selectBlackList(pageInfo);
		
		
		String path = "";
		if(blackList != null) {
			path = "/WEB-INF/views/admin/user/userBlist.jsp";
			request.setAttribute("blackList", blackList);
			request.setAttribute("pageInfo", pageInfo);
		} 
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
