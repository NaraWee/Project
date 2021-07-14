package com.bonggeuda.sugbag.model.dao;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import com.bonggeuda.sugbag.common.config.ConfigLocation;
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

public class UserMypageDAO {
	
	private Properties prop = new Properties();
	
	public UserMypageDAO() {
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "/guest/mypage/mypage-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 가지고있는 포인트 정보 조회
	 * @param con
	 * @param userNo
	 * @return
	 */
	public PointDTO pointSelect(Connection con, int userNo) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		PointDTO point = null;
		
		String query = prop.getProperty("point");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				point = new PointDTO();
				
				point.setPoint(rset.getInt("POINT"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return point;
	}
	
	/**
	 * 포인트 이력 정보 조회
	 * @param con
	 * @param userNo 
	 * @param pageInfo 
	 * @param pageInfo 
	 * @return
	 */
	public List<PointHistoryDTO> pointHistorySelect(Connection con, int userNo) {

		System.out.println("서블릿요청3333");
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<PointHistoryDTO> pointHistory = null;
		PageInfoDTO pafeInfo = new PageInfoDTO();
		
		String query = prop.getProperty("pointHistory2");
		
		pointHistory = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				PointHistoryDTO pointHistoryDTO = new PointHistoryDTO();
				
				pointHistoryDTO.setPointPath(rset.getString("POINT_PATH"));
				pointHistoryDTO.setGetuseType(rset.getString("GETUSE_TYPE_GU"));
				pointHistoryDTO.setGuDate(rset.getDate("GU_DATE"));
				pointHistoryDTO.setPoint(rset.getInt("POINT"));
				
				pointHistory.add(pointHistoryDTO);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pointHistory;
	}

	/**
	 * 포인트 이력 정보 조회
	 * @param con
	 * @param userNo 
	 * @param pageInfo 
	 * @param pageInfo 
	 * @return
	 */
	public List<PointHistoryDTO> pointHistorySelect(Connection con, int userNo, PageInfoDTO pageInfo) {

		System.out.println("서블릿요청3333");
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<PointHistoryDTO> pointHistory = null;
		
		String query = prop.getProperty("pointHistory");
		
		pointHistory = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				PointHistoryDTO pointHistoryDTO = new PointHistoryDTO();
				
				pointHistoryDTO.setPointPath(rset.getString("POINT_PATH"));
				pointHistoryDTO.setGetuseType(rset.getString("GETUSE_TYPE_GU"));
				pointHistoryDTO.setGuDate(rset.getDate("GU_DATE"));
				pointHistoryDTO.setPoint(rset.getInt("POINT"));
				
				pointHistory.add(pointHistoryDTO);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pointHistory;
	}

	/**
	 * 보유 쿠폰 개수 조회
	 * @param con
	 * @param userNo
	 * @return
	 */
	public int couponCount(Connection con, int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("couponCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 보유 쿠폰 정보 조회
	 * @param con
	 * @param userNo
	 * @param pageInfo 
	 * @return
	 */
	public List<CouponDTO> couponSelect(Connection con, int userNo, PageInfoDTO pageInfo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<CouponDTO> couponList = new ArrayList<>();
		
		String query = prop.getProperty("couponList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				CouponDTO coupon = new CouponDTO();
				coupon.setCouponName(rset.getString("COUPON_NAME"));
				coupon.setCouponDiscount(rset.getInt("COUPON_DISCOUNT"));
				coupon.setCouponCondition(rset.getString("COUPON_CONDITION"));
				coupon.setCouponStart(rset.getDate("COUPON_START"));
				coupon.setCouponEnd(rset.getDate("COUPON_END"));
				
				
				couponList.add(coupon);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return couponList;
	}

	/**
	 * 내 정보 조회
	 * @param con
	 * @param userNo
	 * @return
	 */
	public MemberDTO myinfoSelect(Connection con, int userNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		MemberDTO member = null;
		
		String query = prop.getProperty("myinfoSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				member = new MemberDTO();
				member.setNickName(rset.getString("USER_NICKNAME"));
				member.setUserPhone(rset.getString("USER_PHONE"));
				member.setReportCnt(rset.getInt("REPORT_COUNT"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	/**
	 * 사용자 닉네임 변경
	 * @param con
	 * @param userMyinfo
	 * @return
	 */
	public int updateUserNickNmae(Connection con, MemberDTO userMyinfo) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("nickNameUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userMyinfo.getNickName());
			pstmt.setInt(2, userMyinfo.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 사용자 전화번호 변경
	 * @param con
	 * @param userMyinfo
	 * @return
	 */
	public int updateUserPhone(Connection con, MemberDTO userMyinfo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("phoneUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userMyinfo.getUserPhone());
			pstmt.setInt(2, userMyinfo.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 사용자 비밀번호 변경
	 * @param con
	 * @param userMyinfo
	 * @return
	 */
	public int updateUserPwd(Connection con, MemberDTO userMyinfo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("passwordUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userMyinfo.getUserPwd());
			pstmt.setInt(2, userMyinfo.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 사용자 회원탈퇴로 정보 변경
	 * @param con
	 * @param userWithdraw
	 * @param userWithdrawReason 
	 * @return
	 */
	public int userWithdraw(Connection con, MemberDTO userWithdraw, WithdrawReasonDTO userWithdrawReason) {

		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("withdrawUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setDate(1, userWithdraw.getWithDrawDate());
			pstmt.setInt(2, userWithdraw.getUserNo());
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String query2 = prop.getProperty("withdrawInsert");
		
		try {
			pstmt = con.prepareStatement(query2);
			pstmt.setInt(1, userWithdrawReason.getMemberNo());
			pstmt.setString(2, userWithdrawReason.getWithdrawReason());
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		result = result1 + result2;
		
		return result;
	}

	
	/**
	 * 신고한 리스트 조회
	 * @param con
	 * @param userNo
	 * @param pageInfo 
	 * @return
	 */
	public List<ReportDTO> selectReportList(Connection con, int userNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<ReportDTO> report = new ArrayList<>();
		
		String query = prop.getProperty("reportListSelect2");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ReportDTO reportDTO = new ReportDTO();
				
				reportDTO.setReportNo(rset.getInt("REPORT_NO"));
				reportDTO.setReportTitle(rset.getString("REPORT_TITLE"));
				reportDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				reportDTO.setReportDate(rset.getDate("REPORT_DATE"));
				reportDTO.setReportStatus(rset.getString("REPORT_STATUS"));
				
				report.add(reportDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return report;
	}
	
	/**
	 * 신고한 리스트 조회
	 * @param con
	 * @param userNo
	 * @param pageInfo 
	 * @return
	 */
	public List<ReportDTO> selectReportList(Connection con, int userNo, PageInfoDTO pageInfo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<ReportDTO> report = new ArrayList<>();
		
		String query = prop.getProperty("reportListSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ReportDTO reportDTO = new ReportDTO();
				
				reportDTO.setReportNo(rset.getInt("REPORT_NO"));
				reportDTO.setReportTitle(rset.getString("REPORT_TITLE"));
				reportDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				reportDTO.setReportDate(rset.getDate("REPORT_DATE"));
				reportDTO.setReportStatus(rset.getString("REPORT_STATUS"));
				reportDTO.setRowNum(rset.getInt("RNUM"));
				
				report.add(reportDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return report;
	}

	/**
	 * 신고 상세 내용 조회
	 * @param reportedNo 
	 * @return
	 */
	public ReportDTO selectReportContent(Connection con, int userNo, int reportedNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ReportDTO userReportContent = null;
		
		String query = prop.getProperty("reportContent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, reportedNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				userReportContent = new ReportDTO();
				
				userReportContent.setReportTitle(rset.getString("REPORT_TITLE"));
				userReportContent.setAccomoName(rset.getString("ACCOMO_NAME"));
				userReportContent.setReportDate(rset.getDate("REPORT_DATE"));
				userReportContent.setReportReason(rset.getString("REPORT_REASON"));
				userReportContent.setReportAnswer(rset.getString("REPORT_ANSWER"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(userReportContent == null) {
			
			String query2 = prop.getProperty("reportContentTwo");
			
			try {
				pstmt = con.prepareStatement(query2);
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, reportedNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					
					userReportContent = new ReportDTO();
					
					userReportContent.setReportTitle(rset.getString("REPORT_TITLE"));
					userReportContent.setAccomoName(rset.getString("ACCOMO_NAME"));
					userReportContent.setReportDate(rset.getDate("REPORT_DATE"));
					userReportContent.setReportReason(rset.getString("REPORT_REASON"));
					userReportContent.setReportAnswer(rset.getString("REPORT_ANSWER"));
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		}
		
		return userReportContent;
	}

	/**
	 * 신고 이미지 조회하기
	 * @param con
	 * @param userNo
	 * @param reportedNo
	 * @return
	 */
	public List<AttachmentDTO> selectReportImg(Connection con, int userNo, int reportedNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<AttachmentDTO> userReportImg = new ArrayList<>();
		
		String query = prop.getProperty("reportImgSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, reportedNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				AttachmentDTO reportImg = new AttachmentDTO();
				
				reportImg.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));
				
				userReportImg.add(reportImg);
			} 
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userReportImg;
	}

	/**
	 * 닉네임 변경시 중복체크 할 닉네임 조회
	 * @param con
	 * @param inputNickName
	 * @return
	 */
	public int selectUserNickName(Connection con, String inputNickName) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("userNicknameSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, inputNickName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 예약리스트 조회
	 * @param con
	 * @param userNo
	 * @return
	 */
	public List<BookDTO> selectUserBookList(Connection con, int userNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<BookDTO> bookList = new ArrayList<>();
		
		String query = prop.getProperty("userBookListSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				BookDTO bookDTO = new BookDTO();
				bookDTO.setBookNo(rset.getInt("BOOK_NO"));
				bookDTO.setBookCheckDate(rset.getString("BOOK_CHECK_DATE"));
				bookDTO.setBookCheckoutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				bookDTO.setBookApproveYn(rset.getString("BOOK_APPROVE_YN"));
				bookDTO.setBookCheckIn(rset.getString("BOOK_CHECK_IN"));
				bookDTO.setRoomName(rset.getString("ROOM_NAME"));
				bookDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				bookDTO.setBookImg(rset.getString("THUMBNAIL_PATH"));
				
				/* 숙박일수 구하기 */
				SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date startDate = dataFormat.parse(rset.getString("BOOK_CHECK_DATE"));
					Date endDate = dataFormat.parse(rset.getString("BOOK_CHECKOUT_DATE"));
					bookDTO.setDay((endDate.getTime() - startDate.getTime())/(24*60*60*1000));
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				bookList.add(bookDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bookList;
	}

	/**
	 * 이용 완료한 목록 조회하기
	 * @param con
	 * @param userNo
	 * @return
	 */
	public List<BookDTO> completeBooklist(Connection con, int userNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<BookDTO> completeBooklist = new ArrayList<>();
		
		String query = prop.getProperty("userCompleteBookListSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				BookDTO completebookDTO = new BookDTO();
				completebookDTO.setBookNo(rset.getInt("BOOK_NO"));
				completebookDTO.setBookCheckDate(rset.getString("BOOK_CHECK_DATE"));
				completebookDTO.setBookCheckoutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				completebookDTO.setBookApproveYn(rset.getString("BOOK_APPROVE_YN"));
				completebookDTO.setBookCheckIn(rset.getString("BOOK_CHECK_IN"));
				completebookDTO.setRoomName(rset.getString("ROOM_NAME"));
				completebookDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				completebookDTO.setBookImg(rset.getString("THUMBNAIL_PATH"));
				
				/* 숙박일수 구하기 */
				SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date startDate = dataFormat.parse(rset.getString("BOOK_CHECK_DATE"));
					Date endDate = dataFormat.parse(rset.getString("BOOK_CHECKOUT_DATE"));
					completebookDTO.setDay((endDate.getTime() - startDate.getTime())/(24*60*60*1000));
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				completeBooklist.add(completebookDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return completeBooklist;
		
	}

	/**
	 * 예약 취소한 목록 조회하기
	 * @param con
	 * @param userNo
	 * @return
	 */
	public List<BookDTO> selectCancleBooklist(Connection con, int userNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<BookDTO> cancleBooklist = new ArrayList<>();
		
		String query = prop.getProperty("userCancleBookListSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				BookDTO canclebookDTO = new BookDTO();
				canclebookDTO.setBookNo(rset.getInt("BOOK_NO"));
				canclebookDTO.setBookCheckDate(rset.getString("BOOK_CHECK_DATE"));
				canclebookDTO.setBookCheckoutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				canclebookDTO.setBookApproveYn(rset.getString("BOOK_APPROVE_YN"));
				canclebookDTO.setBookCheckIn(rset.getString("BOOK_CHECK_IN"));
				canclebookDTO.setRoomName(rset.getString("ROOM_NAME"));
				canclebookDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				canclebookDTO.setBookImg(rset.getString("THUMBNAIL_PATH"));
				
				/* 숙박일수 구하기 */
				SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date startDate = dataFormat.parse(rset.getString("BOOK_CHECK_DATE"));
					Date endDate = dataFormat.parse(rset.getString("BOOK_CHECKOUT_DATE"));
					canclebookDTO.setDay((endDate.getTime() - startDate.getTime())/(24*60*60*1000));
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				cancleBooklist.add(canclebookDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cancleBooklist;
	}

	/**
	 * 예약 취소 내역 조회
	 * @param con
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public UserBookContentDTO selectCancleContent(Connection con, int userNo, int bookNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		UserBookContentDTO userCancleContent = new UserBookContentDTO();
		
		String query = prop.getProperty("userCancleContentSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				userCancleContent.setBookCheckDate(rset.getString("BOOK_CHECK_DATE"));
				userCancleContent.setCheckoutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				userCancleContent.setBookCheckIn(rset.getString("BOOK_CHECK_IN"));
				userCancleContent.setCheckOut(rset.getString("CHECK_OUT"));
				userCancleContent.setBookNo(rset.getInt("BOOK_NO"));
				userCancleContent.setBookUserName(rset.getString("BOOK_USER_NAME"));
				userCancleContent.setBookPhone(rset.getString("BOOK_PHONE"));
				userCancleContent.setCancleAmount(rset.getInt("CANCLE_AMOUNT"));
				userCancleContent.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));
				userCancleContent.setAccomoName(rset.getString("ACCOMO_NAME"));
				userCancleContent.setRoomName(rset.getString("ROOM_NAME"));
				userCancleContent.setAccomoNo(rset.getInt("ACCOMO_NO"));
				userCancleContent.setRoomNo(rset.getInt("ROOM_NO"));
				userCancleContent.setPaymentTime(rset.getDate("PAYMENT_TIME"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userCancleContent;
	}

	/**
	 * 이용 완료 내역 조회
	 * @param con
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public UserBookContentDTO selectCompleteContent(Connection con, int userNo, int bookNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		UserBookContentDTO userCompleteContent = new UserBookContentDTO();
		
		String query = prop.getProperty("userCompleteContentSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				userCompleteContent.setBookCheckDate(rset.getString("BOOK_CHECK_DATE"));
				userCompleteContent.setCheckoutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				userCompleteContent.setBookCheckIn(rset.getString("BOOK_CHECK_IN"));
				userCompleteContent.setCheckOut(rset.getString("CHECK_OUT"));
				userCompleteContent.setBookNo(rset.getInt("BOOK_NO"));
				userCompleteContent.setBookUserName(rset.getString("BOOK_USER_NAME"));
				userCompleteContent.setBookPhone(rset.getString("BOOK_PHONE"));
				userCompleteContent.setPaymentAmount(rset.getInt("PAYMENT_AMOUNT"));
				userCompleteContent.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));
				userCompleteContent.setAccomoName(rset.getString("ACCOMO_NAME"));
				userCompleteContent.setRoomName(rset.getString("ROOM_NAME"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userCompleteContent;
	}

	/**
	 * 예약한 내역 조회하기
	 * @param con
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public UserBookContentDTO selectBookContent(Connection con, int userNo, int bookNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		UserBookContentDTO userBookContent = new UserBookContentDTO();
		
		String query = prop.getProperty("userBookContentSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {				
				
				userBookContent.setBookCheckDate(rset.getString("BOOK_CHECK_DATE"));
				userBookContent.setCheckoutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				userBookContent.setBookCheckIn(rset.getString("BOOK_CHECK_IN"));
				userBookContent.setCheckOut(rset.getString("CHECK_OUT"));
				userBookContent.setBookNo(rset.getInt("BOOK_NO"));
				userBookContent.setBookUserName(rset.getString("BOOK_USER_NAME"));
				userBookContent.setBookPhone(rset.getString("BOOK_PHONE"));
				userBookContent.setPaymentAmount(rset.getInt("PAYMENT_AMOUNT"));
				userBookContent.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));
				userBookContent.setAccomoName(rset.getString("ACCOMO_NAME"));
				userBookContent.setRoomName(rset.getString("ROOM_NAME"));
				userBookContent.setBookApproveYN(rset.getString("BOOK_APPROVE_YN"));
				
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userBookContent;
	}

	/**
	 * 예약 취소하기 페이지 내역 조회
	 * @param con
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public UserBookContentDTO selectBookCancle(Connection con, int userNo, int bookNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		UserBookContentDTO userBookCancle = new UserBookContentDTO();
		
		String query = prop.getProperty("userBookCancleSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				/* 취소 수수료 구하기 */
				SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
				
					Date checkInDate;
					try {
						checkInDate = dataFormat.parse(rset.getString("BOOK_CHECK_DATE"));
						String date = dataFormat.format(new Date());
						Date sysDate = dataFormat.parse(date);
						long dateInterval = ((checkInDate.getTime() - sysDate.getTime())/(24*60*60*1000));
						
						if(dateInterval > 2) {
							userBookCancle.setCancleFee((int)(rset.getInt("PAYMENT_AMOUNT") * 0));
						} else if(dateInterval > 1) {
							userBookCancle.setCancleFee((int)(rset.getInt("PAYMENT_AMOUNT") * 0.1));
						} else {
							userBookCancle.setCancleFee((int)(rset.getInt("PAYMENT_AMOUNT") * 0.2));
						}
						
					} catch (ParseException e) {
						e.printStackTrace();
					}
				
				userBookCancle.setBookCheckDate(rset.getString("BOOK_CHECK_DATE"));
				userBookCancle.setCheckoutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				userBookCancle.setBookCheckIn(rset.getString("BOOK_CHECK_IN"));
				userBookCancle.setCheckOut(rset.getString("CHECK_OUT"));
				userBookCancle.setBookNo(rset.getInt("BOOK_NO"));
				userBookCancle.setBookUserName(rset.getString("BOOK_USER_NAME"));
				userBookCancle.setBookPhone(rset.getString("BOOK_PHONE"));
				userBookCancle.setPaymentAmount(rset.getInt("PAYMENT_AMOUNT"));
				userBookCancle.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));
				userBookCancle.setAccomoName(rset.getString("ACCOMO_NAME"));
				userBookCancle.setRoomName(rset.getString("ROOM_NAME"));
				userBookCancle.setPaymentMethod(rset.getString("PAYMENT_METHOD"));
				userBookCancle.setPaymentNo(rset.getInt("PAYMENT_NO"));
				userBookCancle.setRefundAmount((rset.getInt("PAYMENT_AMOUNT")-userBookCancle.getCancleFee()));
				userBookCancle.setAccomoNo(rset.getInt("ACCOMO_NO"));
				userBookCancle.setRoomNo(rset.getInt("ROOM_NO"));
				userBookCancle.setPaymentTime(rset.getDate("PAYMENT_TIME"));
				userBookCancle.setBookApproveYN(rset.getString("BOOK_APPROVE_YN"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userBookCancle;
		
	}

	/**
	 * 예약 취소사유 insert & 예약내역 update & 판매내역 insert
	 * @param con
	 * @param userCancelReason
	 * @param bookNo 
	 * @param userNo 
	 * @return
	 */
	public int insertCancel(Connection con, UserBookContentDTO userCancelReason, int userNo, int bookNo) {

		int result = 0;
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		PreparedStatement pstmt = null;
		
		/* 예약 취소사유 insert */
		String query = prop.getProperty("cancelHistoryInsert");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userCancelReason.getReasonCancle());
			pstmt.setInt(2, userCancelReason.getPaymentNo());
			pstmt.setInt(3, userCancelReason.getRefundAmount());
			
			result1 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		/* 예약내역 update */
		String query2 = prop.getProperty("cancelBookListUpdate");
		
		try {
			
			pstmt = con.prepareStatement(query2);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bookNo);
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(userCancelReason.getCancleFee() > 0) {
			/* 판매내역 insert */
			String query3 = prop.getProperty("salesHistoryInsert");
			
			try {
				pstmt = con.prepareStatement(query3);
				pstmt.setInt(1, userCancelReason.getAccomoNo());
				pstmt.setInt(2, userCancelReason.getRoomNo());
				pstmt.setDate(3, userCancelReason.getPaymentTime());
				pstmt.setInt(4, userCancelReason.getCancleFee());
				pstmt.setInt(5, userCancelReason.getPaymentNo());
				
				result3 = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally { 
				close(pstmt);
			}
		} else {
			result3 = 1;
			close(pstmt);
		}

		
		result = result1 + result2 + result3;
		
		return result;
	}

	/**
	 * 리뷰 기본정보 조회하기
	 * @param con
	 * @param userNo
	 * @param bookNo
	 * @return
	 */
	public UserBookContentDTO selectreviewInfo(Connection con, int userNo, int bookNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		UserBookContentDTO reviewInfo = new UserBookContentDTO();
		
		String query = prop.getProperty("reviewInfoSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				reviewInfo.setAccomoName(rset.getString("ACCOMO_NAME"));
				reviewInfo.setRoomName(rset.getString("ROOM_NAME"));
				reviewInfo.setBookNo(bookNo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewInfo;
	}

	/**
	 * 리뷰 insert
	 * @param con
	 * @param userReview
	 * @return
	 */
	public int insertReview(Connection con, ReviewDTO userReview) {

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("reviewInsert");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, userReview.getContent());
			pstmt.setInt(2, userReview.getStarPoint());
			pstmt.setInt(3, userReview.getBookNo());
			pstmt.setString(4, userReview.getTitle());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 리뷰 사진 insert
	 * @param con
	 * @param attachmentDTO
	 * @return
	 */
	public int insertAttachment(Connection con, AttachmentDTO attachmentDTO) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReviewAttachment");
		try {
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			System.out.println(attachmentDTO);
			pstmt.setInt(1, attachmentDTO.getCategoryNo());
			pstmt.setString(2, attachmentDTO.getOriginName());
			pstmt.setString(3, attachmentDTO.getSavedName());
			pstmt.setString(4, attachmentDTO.getSavePath());
			pstmt.setString(5, attachmentDTO.getFileType());
			pstmt.setString(6, attachmentDTO.getThumbnailPath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	/**
	 * 리뷰내역 조회하기
	 * @param con
	 * @param userNo
	 * @param bookNo 
	 * @return
	 */
	public ReviewDTO reviewSelect(Connection con, int userNo, int bookNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ReviewDTO review = null;
		
		String query = prop.getProperty("reviewHistorySelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				review = new ReviewDTO();
				
				review.setBookNo(rset.getInt("BOOK_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return review;
	}


}
