package com.bonggeuda.sugbag.common.queryBuilder;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.bonggeuda.sugbag.model.dto.AccomoSearchDTO;
import com.bonggeuda.sugbag.model.dto.ReviewDTO;

public class QueryBuilder {

	public StringBuilder queryBuiler(AccomoSearchDTO search) {
		
		StringBuilder qr = new StringBuilder();
		String select = "SELECT\r\n"
				+ "       AI.ACCOMO_NO 번호\r\n"
				+ "     , AI.ACCOMO_NAME 이름\r\n"
				+ "     , MIN(RI.ROOM_FEE) 최저가\r\n"
				+ "     , AI.ACCOMO_PATH 경로\r\n"
				+ "     , AT.THUMBNAIL_PATH 사진\r\n"
				+ "  FROM ACCOMO_INFO AI\r\n"
				+ "  JOIN ROOM_INFO RI ON (AI.ACCOMO_NO = RI.ACCOMO_NO)\r\n"
				+ "  JOIN ATTACHMENT AT ON (AI.ACCOMO_NO = AT.REF_NO)\r\n"
				+ " WHERE ROOM_MAX >=?\r\n"
				+ "   AND VISIBLE_YN = 'Y'\r\n"
				+ "   AND ACCOMO_TYPE = ?\r\n"
				+ "   AND CATEGORY_NO = ?\r\n";
		qr.append(select);
		if(search.getFacility() != null) {
			String searchCondition = LikeBuilder(search.getFacility()).toString();
			qr.append(searchCondition);
		}
		String group = "GROUP BY AI.ACCOMO_NO, AI.ACCOMO_NAME, ACCOMO_PATH, AT.THUMBNAIL_PATH";
		qr.append(group);
		return qr;
	}
	
	public StringBuilder LikeBuilder (String[] strArray) {
		
		StringBuilder like = new StringBuilder(); 
		String start = "AND(";
		like.append(start);
		for(int i = 0; i < strArray.length; i++) {
			if(i < strArray.length - 1) {
				String condition = "ACCOMO_FACILITY LIKE '%" + strArray[i] +"%' AND ";
				like.append(condition);
			} else {
				String condition = "ACCOMO_FACILITY LIKE '%" + strArray[i] +"%')\r\n";
				like.append(condition);
			}
		}
		return like;
	}

	public StringBuilder reviewSelectBuilder(List<ReviewDTO> bestReview) {
		
		StringBuilder qr = new StringBuilder();
		String select = "SELECT \r\n"
				+ "       A.RNUM\r\n"
				+ "     , A.리뷰번호\r\n"
				+ "     , A.리뷰내용\r\n"
				+ "     , A.별점\r\n"
				+ "     , A.예약번호\r\n"
				+ "     , A.리뷰제목\r\n"
				+ "     , A.작성자\r\n"
				+ "  FROM (SELECT ROWNUM RNUM\r\n"
				+ "             , B.리뷰번호\r\n"
				+ "             , B.리뷰내용\r\n"
				+ "             , B.별점\r\n"
				+ "             , B.예약번호\r\n"
				+ "             , B.리뷰제목\r\n"
				+ "             , B.작성자\r\n"
				+ "          FROM(SELECT\r\n"
				+ "                       RV.REVIEW_NO 리뷰번호\r\n"
				+ "                     , RV.REVIEW_CONTENT 리뷰내용\r\n"
				+ "                     , RV.STAR_POINT 별점\r\n"
				+ "                     , RV.BOOK_NO 예약번호\r\n"
				+ "                     , RV.REVIEW_TITLE 리뷰제목\r\n"
				+ "                     , UI.USER_NICKNAME 작성자\r\n"
				+ "                  FROM REVIEW RV   \r\n"
				+ "                  JOIN BOOK_LIST BL ON(RV.BOOK_NO = BL.BOOK_NO)\r\n"
				+ "                  JOIN ROOM_INFO RI ON(BL.ROOM_NO = RI.ROOM_NO)\r\n"
				+ "                  JOIN USER_INFO UI ON(BL.USER_NO = UI.USER_NO)\r\n"
				+ "                 WHERE RI.ACCOMO_NO = ? ";
		qr.append(select);
		if(bestReview.size()>0) {
			String searchCondtion = NotInBuilder(bestReview).toString();
			qr.append(searchCondtion);
		}
		String select2 = "ORDER BY RV.REVIEW_NO DESC\r\n"
				+ "                ) B\r\n"
				+ "          )A\r\n";
		qr.append(select2);
		return qr; 
		
	}
	
//    public StringBuilder reviewCountBuilder(List<ReviewDTO> bestReview) {
//		
//		StringBuilder qr = new StringBuilder();
//		String select = "SELECT\r\n"
//				+ "       COUNT(*) 총수\r\n"
//				+ "  FROM REVIEW RV   \r\n"
//				+ "  JOIN BOOK_LIST BL ON(RV.BOOK_NO = BL.BOOK_NO)\r\n"
//				+ "  JOIN ROOM_INFO RI ON(BL.ROOM_NO = RI.ROOM_NO)\r\n"
//				+ "  JOIN USER_INFO UI ON(BL.USER_NO = UI.USER_NO)\r\n"
//				+ " WHERE RI.ACCOMO_NO = ?";
//		qr.append(select);
//		if(bestReview.size()>0) {
//			String searchCondtion = NotInBuilder(bestReview).toString();
//			qr.append(searchCondtion);
//		}
//		return qr; 
//		
//	}

    public StringBuilder NotInBuilder (List<ReviewDTO> review) {
	
	    StringBuilder notIn = new StringBuilder(); 
	    String start = "AND RV.REVIEW_NO NOT IN(";
	    notIn.append(start);
	    
	    for(int i = 0; i < review.size(); i++) {
	    	if(i < review.size()-1) {
	    		String condition = review.get(i).getReviewNo() + ",";
	    		notIn.append(condition);
	    	} else {
	    		String condition = review.get(i).getReviewNo() + ")";
	    		notIn.append(condition);
	    	}
	    }
        
	    return notIn;
}
}
