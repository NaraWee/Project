package com.bonggeuda.sugbag.owner.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.common.paging.PageNation;
import com.bonggeuda.sugbag.model.dto.AccomoDTO;
import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.SettlementDTO;
import com.bonggeuda.sugbag.owner.book.service.BookListSelectService;
import com.bonggeuda.sugbag.owner.mypage.service.OwnerMypagService;
import com.bonggeuda.sugbag.owner.notice.service.QuestionService;

/**
 * Servlet implementation class SettlementRequest
 */
@WebServlet("/owner/settlement")
public class SettlementList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//로그인 값
		HttpSession session = request.getSession();
		int ownerNo = (Integer)session.getAttribute("ownerNo");
		
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
		OwnerMypagService stlService = new OwnerMypagService();
		
		int stlTotalCount = stlService.selectStlTotalCount(ownerNo);
		
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, stlTotalCount, limit, buttonAmount);

	
		/*결과값 반환*/
		List<SettlementDTO> selectStl = stlService.selectStl(pageInfo,ownerNo);
		List<AccomoDTO> selectAccomo = stlService.selectAccomo(ownerNo);
		
		String path = "";
		path = "/WEB-INF/views/owner/mypage/settlementList.jsp";
		request.setAttribute("selectStl", selectStl);
		request.setAttribute("selectAccomo", selectAccomo);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int accomoNo = Integer.parseInt(request.getParameter("accomoNo"));
		
		/*값을 전달하기 위한 비지니스 로직 호출*/
		OwnerMypagService reqStl = new OwnerMypagService();
		
		/*결과값 반환*/
		int insertStl = reqStl.insertStl(accomoNo); //값을 int형으로 반환받아야 함
		
		String path = "";
		path = "/WEB-INF/views/owner/mypage/settlementSuccess.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

}
