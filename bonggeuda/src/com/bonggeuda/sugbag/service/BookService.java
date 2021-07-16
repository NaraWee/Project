package com.bonggeuda.sugbag.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bonggeuda.sugbag.model.dao.BookDAO;
import com.bonggeuda.sugbag.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.model.dto.AccomoSearchDTO;
import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.CouponHistoryDTO;
import com.bonggeuda.sugbag.model.dto.OwnerQnADTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.PaymentDTO;
import com.bonggeuda.sugbag.model.dto.PointHistoryDTO;
import com.bonggeuda.sugbag.model.dto.ReviewDTO;
import com.bonggeuda.sugbag.model.dto.RoomDTO;

public class BookService {
	
	private final BookDAO bookDao;
	
	public BookService() {
		bookDao = new BookDAO();
	}

	/**

	 * 숙소타입별 리스트 조회
	 * @param type 숙소타입
	 * @return 타입별 숙소리스트

	 */
	public List<AccomoInfoDTO> selectAccomoList(String type,int category) {
		
		Connection con = getConnection();
		List<AccomoInfoDTO> accomoList = null;
		
		accomoList = bookDao.selectAccomoList(con, type, category);
		close(con);
		return accomoList;
	}


	/**
	 * 숙소 최저가, 평점 조회
	 * @param type 숙소타입
	 * @return 숙소 최저가, 평점
	 */
	public List<Map> selectPriceNstar(String type) {
		
		Connection con = getConnection();
		List<Map> priceNrvScore = null;
		
		priceNrvScore = bookDao.selectPriceNScore(con,type);
		close(con);
		return priceNrvScore;

	}

	/**
	 * 숙소 1개 정보 조회
	 * @param accomoNo 숙소번호, categoryType 첨부파일 카테고리
	 * @return
	 */
	public AccomoInfoDTO selectAccomoInfo(int accomoNo, int categoryType) {
		Connection con = getConnection();
		AccomoInfoDTO accomo = null;
		
		accomo = bookDao.selectAccomoInfo(con, accomoNo, categoryType);
		close(con);
		
		return accomo;
	}

	/**
	 * 숙소의 객실정보 조회
	 * @param accomoNo 숙소번호
	 * @return
	 */
	public List<RoomDTO> selectRoomList(int accomoNo,int categoryType) {
		
		Connection con = getConnection();
		List<RoomDTO> roomList = null;
		
		roomList = bookDao.selectRoomList(con, accomoNo, categoryType);
		
		close(con);
		return roomList;
	}

	/**
	 * 고객->업주 문의 등록
	 * @param qna 문의정보
	 * @return
	 */
	public int insertOwnerQnA(OwnerQnADTO qna) {
		
		Connection con = getConnection();
		int result = 0;
		
		result = bookDao.insertOwnerQnA(con, qna);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	/**
	 * 이용자 1명의 쿠폰과 포인트를 조회
	 * @param userNo 이용자번호
	 * @return
	 */
	public List selectCouponPoint(int userNo) {
		
		Connection con = getConnection();
		
		List couponPoint = null;
		
		couponPoint = bookDao.selectCouponPoint(con, userNo);
				
		return couponPoint;
	}

	/**
	 * 숙소 검색
	 * @param type
	 * @param checkList
	 * @param category
	 * @return
	 */
	public List<AccomoInfoDTO> selectAccomoFacility(AccomoSearchDTO search) {

		Connection con = getConnection();
		
		List<AccomoInfoDTO> seachResult = null;  
		seachResult = bookDao.selectAccomoFacility(con, search);  
		
		close(con);
		return seachResult;
	}

	/**
	 * 숙소의 베스트리뷰조회
	 * @param accomoNo 숙소번호
	 * @return
	 */
	public List<ReviewDTO> selectBestReview(int accomoNo) {
		
		Connection con = getConnection();
		
		List<ReviewDTO> bestReview = null;
		
		bestReview = bookDao.selectBestReview(con, accomoNo);
		
		close(con);
		
		return bestReview;
	}

	/**
	 * 리뷰 업다운 갯수 카운트
	 * @param accomoNo
	 * @return
	 */
	public List<Map<Integer, Integer>> selectUpDownCnt(int accomoNo) {

		Connection con = getConnection();
		
		List<Map<Integer,Integer>> upNdown = null;
		
		Map<Integer,Integer> upCnt = null;
		Map<Integer,Integer> downCnt = null;
		
		upNdown = new ArrayList<>();
		upCnt = bookDao.selectReviewUpCnt(con, accomoNo);
		downCnt = bookDao.selectReviewDownCnt(con, accomoNo);
		upNdown.add(upCnt);
		upNdown.add(downCnt);
		
		return upNdown;
	}

	/**
	 * 리뷰사진 조회용
	 * @param accomoNo
	 * @param categoryNo
	 * @return
	 */
	public Map<Integer, String> selectReviewPicture(int accomoNo, int categoryNo) {

		Connection con = getConnection();
		Map<Integer, String> reviewPicture = null;
		
		reviewPicture = bookDao.selectAccomoReviewPicture(con, accomoNo, categoryNo); 
		
		close(con);
		return reviewPicture;
	}

	/**
	 * 숙소의 베스트리뷰를 제외한 전체 리뷰
	 * @param bestReview 베스트리뷰 제외를 위한 매개변수
	 * @param accomoNo 숙소번호
	 * @return
	 */
	public List<ReviewDTO> selectAllReviewList(List<ReviewDTO> bestReview, int accomoNo) {
		
		Connection con = getConnection();
		List<ReviewDTO> selectAllReviewList = bookDao.selectAllReview(con, accomoNo, bestReview);
		
		close(con);
		return selectAllReviewList;
	}

	
	/**
	 * 예약,결제,포인트적립,사용,쿠폰사용 INSERT
	 * @param bookInfo 예약정보
	 * @param payment 결제정보
	 * @param pointGet 포인트적립
	 * @param couponUse 쿠폰사용
	 * @param pointUse 포인트사용
	 * @return
	 */
	public int insertBookNpay(BookDTO bookInfo, PaymentDTO payment, PointHistoryDTO pointGet,CouponHistoryDTO couponUse,PointHistoryDTO pointUse) {
		
		Connection con = getConnection();
		
		int insertAllResult = 0;
		int standard = 3;
		
		//예약정보insert
		int bookInsertResult = 0;
		bookInsertResult = bookDao.insertBookInfo(con, bookInfo);
		if(bookInsertResult > 0) {
			insertAllResult++;
		}
		//결제정보insert
		int bookSEQ = bookDao.selectBookSeq(con);
		payment.setBookNo(bookSEQ);
		int paymentInsertResult = 0;
		paymentInsertResult = bookDao.insertPaymentInfo(con, payment);
		if(paymentInsertResult > 0) {
			insertAllResult++;
		}
		//포인트적립insert
		int paymentNo = bookDao.selectPaymentSeq(con);
		int pointGetResult = 0;
		pointGet.setPaymentNo(paymentNo);
		pointGetResult = bookDao.insertPointGet(con, pointGet);
		if (pointGetResult > 0) {
			insertAllResult++;
		}
		//쿠폰 사용시 쿠폰이력 insert
		if(payment.getCouponYN().equals("Y")) {
			standard++;
			couponUse.setPaymentNo(paymentNo);
			int couponUseResult = bookDao.insertCouponUse(con, couponUse);
			if(couponUseResult>0) {
				insertAllResult++;
			}
		}
		
		//포인트 사용시 포인트이력 insert
		if(payment.getPointYN().equals("Y")) {
			standard++;
			pointUse.setPaymentNo(paymentNo);
			int pointUseResult = bookDao.insertPointUse(con, pointUse);
			if(pointUseResult>0) {
				insertAllResult++;
			}
		}

		if(standard == insertAllResult) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return insertAllResult;
		
	}

	/**
	 * 객실정보조회
	 * @param roomNo
	 * @return
	 */
	public RoomDTO selectRoomInfo(int roomNo) {
		
		Connection con = getConnection();
		
		RoomDTO roomInfo = null;
		
		roomInfo = bookDao.selectRoomInfo(con, roomNo);
		
		close(con);
		return roomInfo;
	}

	/**
	 * 쿠폰 할인금액 조회
	 * @param couponNo
	 * @return
	 */
	public int selectDiscountAmount(int couponNo) {
		
		Connection con = getConnection();
		
		int discount = 0;
		
		discount = bookDao.selectCouponAmount(con, couponNo);
		
		close(con);
		return discount;
	}

	/**
	 * 유저가 리뷰에 누른 업다운 상태값 조회
	 * @param userNo
	 * @return
	 */
	public Map<Integer, String> selectReviewUpDownStatus(int userNo) {
		
		Connection con = getConnection();
		
		Map<Integer, String> reviewUDstatus = bookDao.selectUpDownStatus(con, userNo);
		
		return reviewUDstatus;
	}

	/**
	 * 리뷰에 업다운 누른 이력이 있는지 확인
	 * @param review
	 * @return 리뷰 이력번호
	 */
	public int selectExistingReview(ReviewDTO review) {

		Connection con = getConnection();
		
		int reviewHistory = 0;
		
		reviewHistory = bookDao.selectExistingReview(con, review);
		
		close(con);
		return reviewHistory;
	}

	/**
	 * 리뷰이력 INSERT
	 * @param review
	 * @return
	 */
	public int insertReviewHistory(ReviewDTO review) {
		
		Connection con = getConnection();
		
		int insertResult = 0;
		
		insertResult = bookDao.insertReviewHistory(con, review);
		
		if(insertResult>0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return insertResult;
	}

	/**
	 * 리뷰이력 UPDATE
	 * @param review
	 * @return
	 */
	public int updateReviewHistory(ReviewDTO review) {
		
	    Connection con = getConnection();
	    
	    int updateResult = 0;
	    
	    updateResult = bookDao.updateReviewHistory(con, review);
	    
	    close(con);
	    
	    if(updateResult>0) {
	    	commit(con);
	    } else {
	    	rollback(con);
	    }
	    close(con);
		return updateResult;
	}

	/**
	 * updown 수 체크
	 * @param review
	 * @return
	 */
	public int[] selectChangeUpDown(ReviewDTO review) {
		
		Connection con = getConnection();
		
		int upCnt = 0;
		upCnt = bookDao.selectUpCnt(con, review);
		
		int downCnt =0;
		downCnt = bookDao.selectUpDownCnt(con, review);
		
		int[] upDown = {upCnt,downCnt};
		
		close(con);
		return upDown;
	}

	/**
	 * 페이징처리를 위한 리뷰 전체 수 조회
	 * @param bestReview
	 * @param accomoNo
	 * @return
	 */
//	public int selectAccomoReviewCount(List<ReviewDTO> bestReview, int accomoNo) {
//		
//		Connection con = getConnection();
//		
//		int totalCount = 0;
//		
//		totalCount = bookDao.selectTotalCount(con, bestReview, accomoNo);
//		
//		close(con);
//		return totalCount;
//	}

}
