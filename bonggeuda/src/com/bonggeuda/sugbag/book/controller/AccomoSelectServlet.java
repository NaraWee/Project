package com.bonggeuda.sugbag.book.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.service.BookService;

/**
 * Servlet implementation class AccomoSelectServlet
 */
@WebServlet("/accomoSelect/list")
public class AccomoSelectServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 숙소타입구분
		String accomoType = request.getParameter("value");
		String type=accomoType;
		// 타입별 숙소 리스트 검색
		BookService booksvc = new BookService();
		// 사진 카테고리
		int category = 3;
		List<AccomoInfoDTO> accomoList= booksvc.selectAccomoList(type,category);

		//최저가(0), 평점(1) 조회
		List<Map> priceNrvScore = booksvc.selectPriceNstar(type);
		
 		String path="";
		if(accomoList != null) {
			for(int i = 0; i < accomoList.size(); i++) {
				int accomoNo = accomoList.get(i).getAccomoNo();
				if(priceNrvScore.get(0).get(accomoNo) != null) {
					accomoList.get(i).setMinPrice((int)priceNrvScore.get(0).get(accomoNo));
				}
				if(priceNrvScore.get(1).get(accomoNo) != null) {
					accomoList.get(i).setReviewScore((double)priceNrvScore.get(1).get(accomoNo));
				}
			}
			path = "/WEB-INF/views/guest/accomoInfo/list.jsp";
			request.setAttribute("accomoList", accomoList);
			request.setAttribute("type", type);
		} else {
			
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
}
