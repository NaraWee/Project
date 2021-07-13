package com.bonggeuda.sugbag.admin.owner.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.admin.owner.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.admin.owner.model.dto.RoomInfoDTO;
import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class AccomoInfoServlet
 */
@WebServlet("/owner/accomoinfo")
public class AccomoInfoServlet extends HttpServlet {
	static int intStaticAccomoNo = 0;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accomoNo = request.getParameter("accomoNo");
		
		AdminService service = new AdminService();

 		Map<String, Object> accomoMap = new HashMap<String, Object>();
 	
 		if(accomoNo != null && !accomoNo.equals("")) {
 			int intAccomoNo = Integer.parseInt(accomoNo);
 			if(intStaticAccomoNo != intAccomoNo) {
 				intStaticAccomoNo = intAccomoNo;
 			}
 		}

 		accomoMap = service.accomoInfoSelect(intStaticAccomoNo);

 		AccomoInfoDTO accomo = (AccomoInfoDTO)accomoMap.get("accomo");
 		
 		List<RoomInfoDTO> roomList = (List<RoomInfoDTO>)accomoMap.get("roomList");

 		
 		
// 		//1. 베스트 리뷰 조회
//		List<ReviewDTO> bestReview = bsvc.selectBestReview(accomoNo);
//
//		// 2. 리뷰의 UP, DOWN을 COUNT 한 값 가져오기(0:업, 1 :다운)
//		List<Map<Integer, Integer>> upDownCnt = bsvc.selectUpDownCnt(accomoNo);
//
//		// 3.리뷰 사진 조회
//		int categoryNo = 5;
//		Map<Integer, String> reviewPicture = bsvc.selectReviewPicture(accomoNo, categoryNo);
//
//		// 베스트리뷰에 좋아요 싫어요 업다운상태 사진 추가
//		for (int i = 0; i < bestReview.size(); i++) {
//			int no = bestReview.get(i).getReviewNo();
//			// 좋아요추가
//			if (upDownCnt.get(0).get(no) != null) {
//				bestReview.get(i).setUpCnt(upDownCnt.get(0).get(no));
//			}
//			// 싫어요추가
//			if (upDownCnt.get(1).get(no) != null) {
//				bestReview.get(i).setDownCnt(upDownCnt.get(1).get(no));
//			}
//			// 사진추가
//			if (reviewPicture.get(no) != null) {
//				AttachmentDTO attach = new AttachmentDTO();
//				attach.setThumbnailPath(reviewPicture.get(no));
//				bestReview.get(i).setAttachment(attach);
//			}
//
//		}
//		// 5.베스트리뷰를 제외한 전체 리뷰 조회
//		List<ReviewDTO> reviewList = bsvc.selectAllReviewList(bestReview, accomoNo);
//
//		for (int i = 0; i < reviewList.size(); i++) {
//			int no = reviewList.get(i).getReviewNo();
//			// 좋아요추가
//			if (upDownCnt.get(0).get(no) != null) {
//				reviewList.get(i).setUpCnt(upDownCnt.get(0).get(no));
//			}
//			// 싫어요추가
//			if (upDownCnt.get(1).get(no) != null) {
//				reviewList.get(i).setDownCnt(upDownCnt.get(1).get(no));
//			}
//			// 사진추가
//			if (reviewPicture.get(no) != null) {
//				AttachmentDTO attach = new AttachmentDTO();
//				attach.setThumbnailPath(reviewPicture.get(no));
//				reviewList.get(i).setAttachment(attach);
//			}
//
//		}
 		
 		
 		String path="";
 		if(accomoMap != null) {
 			path = "/WEB-INF/views/admin/owner/accomoInfo.jsp";
 			request.setAttribute("accomo", accomo);
 			request.setAttribute("roomList", roomList);
 			
//			request.setAttribute("bestReview", bestReview);
//			request.setAttribute("reviewList", reviewList);
 			
 		}

 		request.getRequestDispatcher(path).forward(request, response);
 	}


}
