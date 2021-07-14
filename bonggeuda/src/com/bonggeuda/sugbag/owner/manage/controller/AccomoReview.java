package com.bonggeuda.sugbag.owner.manage.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.common.paging.PageNation;
import com.bonggeuda.sugbag.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.ReviewDTO;
import com.bonggeuda.sugbag.service.BookService;

/**
 * Servlet implementation class AccomoReview
 */
@WebServlet("/owner/accomoReview")
public class AccomoReview extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
//		
//		String path="";
//
//		path = "/WEB-INF/views/guest/accomoInfo/review.jsp ";
//		
//		request.getRequestDispatcher(path).forward(request, response);
        BookService bsvc = new BookService();
        
		//1. 베스트 리뷰 조회
		//int accomoNo = Integer.parseInt(request.getParameter("no"));
        int accomoNo = Integer.parseInt(request.getParameter("accomoNo"));
		List<ReviewDTO> bestReview =  bsvc.selectBestReview(accomoNo);
		
		 //숙소정보, 사진조회
        BookService booksvc = new BookService();
        int categoryType = 3;
        AccomoInfoDTO accomo = booksvc.selectAccomoInfo(accomoNo, categoryType);
		
		//2. 리뷰의 UP, DOWN을 COUNT 한 값 가져오기(0:업, 1 :다운)
		List<Map<Integer,Integer>> upDownCnt = bsvc.selectUpDownCnt(accomoNo);
		
		
		
		//3.리뷰 사진 조회
		int categoryNo = 5;
		Map<Integer,String> reviewPicture = bsvc.selectReviewPicture(accomoNo,categoryNo);
	
//		//4.리뷰업다운상태
//		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
//		int userNo = member.getUserNo();
//		Map<Integer, String> upDownStatus = bsvc.selectReviewUpDownStatus(userNo);
		
		//베스트리뷰에 좋아요 싫어요 업다운상태 사진 추가
		for(int i = 0; i < bestReview.size(); i++) {
			int no = bestReview.get(i).getReviewNo();
			//좋아요추가
			if(upDownCnt.get(0).get(no) != null) {
				bestReview.get(i).setUpCnt(upDownCnt.get(0).get(no));
			}
			//싫어요추가
			if(upDownCnt.get(1).get(no) != null) {
				bestReview.get(i).setDownCnt(upDownCnt.get(1).get(no));
			}
			//사진추가
			if(reviewPicture.get(no) != null) {
				AttachmentDTO attach = new AttachmentDTO();
				attach.setThumbnailPath(reviewPicture.get(no));
				bestReview.get(i).setAttachment(attach);
			}
			
			//업다운상태 추가
//			if(upDownStatus.get(no) != null) {
//				bestReview.get(i).setUpdownStatus(upDownStatus.get(no));
//			}
		}
		//5.베스트리뷰를 제외한 전체 리뷰 조회
		List<ReviewDTO> reviewList = bsvc.selectAllReviewList(bestReview, accomoNo);
		
		for(int i = 0; i < reviewList.size(); i++) {
			int no = reviewList.get(i).getReviewNo();
			//좋아요추가
			if(upDownCnt.get(0).get(no) != null) {
				reviewList.get(i).setUpCnt(upDownCnt.get(0).get(no));
			}
			//싫어요추가
			if(upDownCnt.get(1).get(no) != null) {
				reviewList.get(i).setDownCnt(upDownCnt.get(1).get(no));
			}
			//사진추가
			if(reviewPicture.get(no) != null) {
				AttachmentDTO attach = new AttachmentDTO();
				attach.setThumbnailPath(reviewPicture.get(no));
				reviewList.get(i).setAttachment(attach);
			}
			
			//업다운상태추가
//			if(upDownStatus.get(no) != null) {
//				reviewList.get(i).setUpdownStatus(upDownStatus.get(no));
//			}
		}
		//6.페이징처리
		String currentPage = request.getParameter("currentPage");
        
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		int totalCount = reviewList.size()+bestReview.size();
		
		int limit = 10;
		int buttonAmount = 5;
		
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		String path="";
		
		//리뷰리스트, 베스트리뷰,
		if(bestReview !=null || reviewList!=null) {
			path="/WEB-INF/views/owner/roomManagement/accomoReview.jsp";
			request.setAttribute("bestReview", bestReview);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("accomo", accomo);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("totalCount", totalCount);
			
		} else {
			System.out.println("응 돌아가");
		}
		request.getRequestDispatcher(path).forward(request, response);
		

	}

}
