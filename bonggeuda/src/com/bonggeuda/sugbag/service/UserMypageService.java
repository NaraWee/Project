package com.bonggeuda.sugbag.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bonggeuda.adminEvent.dto.EventDTO;
import com.bonggeuda.sugbag.model.dao.UserMypageDAO;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.CouponDTO;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.PointDTO;
import com.bonggeuda.sugbag.model.dto.PointHistoryDTO;
import com.bonggeuda.sugbag.model.dto.ReportDTO;
import com.bonggeuda.sugbag.model.dto.ReviewDTO;
import com.bonggeuda.sugbag.model.dto.UserBookContentDTO;
import com.bonggeuda.sugbag.model.dto.WithdrawReasonDTO;

public class UserMypageService {
	
	private UserMypageDAO mypageDAO = new UserMypageDAO();

	
	/**
	 * 가지고 있는 포인트 정보 조회
	 * @param userNo 사용자번호
	 * @return
	 */
	public PointDTO pointSelect(int userNo) {

		Connection con = getConnection();
		
		PointDTO pointDTO = mypageDAO.pointSelect(con, userNo);
		
		close(con);
		
		return pointDTO;
	}

	/**
	 * 포인트 이력 정보 조회
	 * @param userNo 
	 * @param pageInfo 
	 * @return
	 */
	public List<PointHistoryDTO> pointHistorySelect(int userNo) {
		
		System.out.println("서블릿요청22222");
		
		Connection con = getConnection();
		
		List<PointHistoryDTO> pointHistory = mypageDAO.pointHistorySelect(con,userNo);
		
		close(con);
		
		return pointHistory;
	}

	/**
	 * 포인트 이력 정보 조회
	 * @param userNo 
	 * @param pageInfo 
	 * @return
	 */
	public List<PointHistoryDTO> pointHistorySelect(int userNo, PageInfoDTO pageInfo) {
		
		System.out.println("서블릿요청22222");
		
		Connection con = getConnection();
		
		List<PointHistoryDTO> pointHistory = mypageDAO.pointHistorySelect(con,userNo, pageInfo);
		
		close(con);
		
		return pointHistory;
	}

	/**
	 * 보유 쿠폰 개수 조회
	 * @param userNo
	 * @return
	 */
	public int couponCount(int userNo) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		result = mypageDAO.couponCount(con, userNo);
		
		close(con);
		
		return result;
	}

	/**
	 * 보유 쿠폰 정보 조회
	 * @param userNo
	 * @param pageInfo 
	 * @return
	 */
	public List<CouponDTO> couponSelect(int userNo, PageInfoDTO pageInfo) {

		Connection con = getConnection();
		
		List<CouponDTO> coupon = mypageDAO.couponSelect(con, userNo, pageInfo);
		
		close(con);
		
		return coupon;
	}


	/**
	 * 내 정보 조회
	 * @param userNo
	 * @return
	 */
	public MemberDTO myinfoSelect(int userNo) {
		
		Connection con = getConnection();
		
		MemberDTO myinfo = mypageDAO.myinfoSelect(con, userNo);
		
		close(con);
		
		return myinfo;
	}


	/**
	 * 사용자 정보 변경
	 * @param userMyinfo
	 * @return
	 */
	public int updateUserinfo(MemberDTO userMyinfo) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		if(userMyinfo.getNickName() != null) {
			result = mypageDAO.updateUserNickNmae(con, userMyinfo);			
		}
		if(userMyinfo.getUserPhone() != null) {
			result = mypageDAO.updateUserPhone(con, userMyinfo);						
		}
		if(userMyinfo.getUserPwd() != null){
			result = mypageDAO.updateUserPwd(con, userMyinfo);									
		}
		
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	/**
	 * 사용자 회원탈퇴로 정보변경
	 * @param userWithdraw
	 * @param userWithdrawReason 
	 * @return
	 */
	public int userWithdraw(MemberDTO userWithdraw, WithdrawReasonDTO userWithdrawReason) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		result = mypageDAO.userWithdraw(con, userWithdraw, userWithdrawReason);
		
		if(result > 1) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	/**
	 * 신고한 리스트 조회
	 * @param userNo
	 * @param pageInfo 
	 * @return
	 */
	public List<ReportDTO> selectReportList(int userNo) {
		
		Connection con = getConnection();
		
		List<ReportDTO> report = mypageDAO.selectReportList(con, userNo);
		
		close(con);
		
		return report;
	}
	
	/**
	 * 신고한 리스트 조회
	 * @param userNo
	 * @param pageInfo 
	 * @return
	 */
	public List<ReportDTO> selectReportList(int userNo, PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<ReportDTO> report = mypageDAO.selectReportList(con, userNo, pageInfo);
		
		close(con);
		
		return report;
	}


	/**
	 * 신고 상세 내용 조회
	 * @return
	 */
	public ReportDTO selectReportContent(int userNo, int reportedNo) {
		
		Connection con = getConnection();
		
		ReportDTO userReportContent = mypageDAO.selectReportContent(con, userNo, reportedNo);
		
		close(con);
		
		return userReportContent;
	}


	/**
	 * 신고 상세 내용 이미지 조회
	 * @param userNo
	 * @param reportedNo
	 * @return
	 */
	public List<AttachmentDTO> selectReportImg(int userNo, int reportedNo) {
		Connection con = getConnection();
		
//		AttachmentDTO userReportImg = mypageDAO.selectReportImg(con, userNo, reportedNo);
		List<AttachmentDTO> userReportImg = mypageDAO.selectReportImg(con, userNo, reportedNo);
		
		close(con);
		
		return userReportImg;
	}


	/**
	 * 닉네임 변경시 중복체크 할 닉네임 조회
	 * @param inputNickName
	 * @return
	 */
	public int selectUserNickName(String inputNickName) {

		Connection con = getConnection();
		
		int userNickName = mypageDAO.selectUserNickName(con, inputNickName);
		
		close(con);
		
		return userNickName;
	}


	/**
	 * 예약리스트 조회
	 * @param userNo
	 * @return
	 */
	public List<BookDTO> selectUserBookList(int userNo) {

		Connection con = getConnection();
		
		List<BookDTO> bookList = mypageDAO.selectUserBookList(con, userNo);
		
		close(con);
		
		return bookList;
	}


	/**
	 * 이용 완료된 목록 조회하기
	 * @param userNo
	 * @return
	 */
	public List<BookDTO> selectCompleteBooklist(int userNo) {
		
		Connection con = getConnection();
		
		List<BookDTO> completeBooklist = mypageDAO.completeBooklist(con, userNo);
		
		close(con);
		
		return completeBooklist;
	}


	/**
	 * 예약 취소한 목록 조회하기
	 * @param userNo
	 * @return
	 */
	public List<BookDTO> selectCancleBooklist(int userNo) {

		Connection con = getConnection();
		
		List<BookDTO> cancleBooklist = mypageDAO.selectCancleBooklist(con, userNo);
		
		close(con);
		
		return cancleBooklist;
	}


	/**
	 * 예약 취소 내역 조회하기
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public UserBookContentDTO selectCancleContent(int userNo, int bookNo) {
		
		Connection con = getConnection();
		
		UserBookContentDTO userCancleContent = mypageDAO.selectCancleContent(con, userNo, bookNo);
		
		close(con);
		
		return userCancleContent;
		
	}


	/**
	 * 이용 완료 내역 조회하기
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public UserBookContentDTO selectCompleteContent(int userNo, int bookNo) {

		Connection con = getConnection();
		
		UserBookContentDTO userCompleteContent = mypageDAO.selectCompleteContent(con, userNo, bookNo);
		
		close(con);
		
		return userCompleteContent;
	}


	/**
	 * 예약한 내역 조회하기
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public UserBookContentDTO selectBookContent(int userNo, int bookNo) {

		Connection con = getConnection();
		
		UserBookContentDTO userBookContent = mypageDAO.selectBookContent(con, userNo, bookNo);
		
		close(con);
		
		return userBookContent;
	}


	/**
	 * 예약 취소하기 페이지 내역 조회
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public UserBookContentDTO selectBookCancle(int userNo, int bookNo) {

		Connection con = getConnection();
		
		UserBookContentDTO userBookCancle = mypageDAO.selectBookCancle(con, userNo, bookNo);
		
		close(con);
		
		return userBookCancle;
	}


	/**
	 * 예약 취소사유 insert & 예약내역 update
	 * @param userCancelReason
	 * @param bookNo 
	 * @param userNo 
	 * @return
	 */
	public int insertCancel(UserBookContentDTO userCancelReason, int userNo, int bookNo) {

		Connection con = getConnection();
		
		int result = mypageDAO.insertCancel(con, userCancelReason, userNo, bookNo);
		
		if(result > 2) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	/**
	 * 리뷰 기본 정보 조회
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public UserBookContentDTO selectreviewInfo(int userNo, int bookNo) {

		Connection con = getConnection();
		
		UserBookContentDTO reviewInfo = mypageDAO.selectreviewInfo(con, userNo, bookNo);
		
		close(con);
		
		return reviewInfo;
		
	}


	/**
	 * 리뷰 insert
	 * @param userReview
	 * @return
	 */
	public int insertReview(ReviewDTO userReview) {

		System.out.println("들어어와오랏");
		Connection con = getConnection();
		
		int result = 0;
		
		int reviewResult = mypageDAO.insertReview(con, userReview);
		
		List<AttachmentDTO> fileList = userReview.getAttachmentList();
		
		int accachmentResult = 0;
		for(int i = 0; i < fileList.size(); i++) {
			accachmentResult += mypageDAO.insertAttachment(con, fileList.get(i));
			System.out.println(accachmentResult);
		}
		if(reviewResult > 0 && accachmentResult == fileList.size()) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
		
	}


	/**
	 * 리뷰내역 조회하기
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public ReviewDTO selectReviewHistory(int userNo, int bookNo) {

		Connection con = getConnection();
		
		ReviewDTO reviewDTO = mypageDAO.reviewSelect(con, userNo, bookNo);
		
		close(con);
		
		return reviewDTO;
		
	}







}
