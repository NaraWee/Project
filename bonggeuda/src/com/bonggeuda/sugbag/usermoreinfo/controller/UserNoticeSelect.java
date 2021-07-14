package com.bonggeuda.sugbag.usermoreinfo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.common.paging.PageNation;
import com.bonggeuda.sugbag.model.dto.NoticeDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.service.UserMoreInfoService;

/**
 * Servlet implementation class UserNoticeSelect
 */
@WebServlet("/usernotice/select")
public class UserNoticeSelect extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserMoreInfoService moreinfoService = new UserMoreInfoService();
		
		List<NoticeDTO> notice2 = new ArrayList<>();
		notice2 = moreinfoService.selectNotice();
		
		
		
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
		int totalCount = notice2.size();
		
		System.out.println("totalCount 체크 : " + totalCount);
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		System.out.println(pageInfo);
		
		
		/* 공지사항 리스트 조회 */
		List<NoticeDTO> notice = moreinfoService.selectNotice(pageInfo);
		
		String path = "/WEB-INF/views/guest/moreNotice/moreNotice.jsp";
		request.setAttribute("notice", notice);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("totalCount", totalCount);
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
