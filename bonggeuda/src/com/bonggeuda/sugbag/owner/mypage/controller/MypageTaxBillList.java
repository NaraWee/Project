package com.bonggeuda.sugbag.owner.mypage.controller;

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
import com.bonggeuda.sugbag.model.dto.AccomoDTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.RequestTaxBillDTO;
import com.bonggeuda.sugbag.owner.mypage.service.OwnerMypagService;

/**
 * Servlet implementation class MypageTexBillList
 */
@WebServlet("/owner/taxbillList")
public class MypageTaxBillList extends HttpServlet {

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
		OwnerMypagService ownerService = new OwnerMypagService();
		
		int taxTotalCount = ownerService.taxTotalCount(ownerNo);
				
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, taxTotalCount, limit, buttonAmount);

		System.out.println(pageInfo);

		List<RequestTaxBillDTO> taxBillList = new ArrayList<>();
		
		taxBillList = ownerService.selectTaxBillList(pageInfo,ownerNo);
		
		String path = "";
		path = "/WEB-INF/views/owner/mypage/mypageTaxbillList.jsp";
		request.setAttribute("taxBillList", taxBillList);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher(path).forward(request, response);

	}

}
