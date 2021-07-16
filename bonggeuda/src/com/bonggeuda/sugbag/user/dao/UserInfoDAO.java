package com.bonggeuda.sugbag.user.dao;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.user.dto.BestReviewDTO;
import com.bonggeuda.sugbag.user.dto.ReservationDetailDTO;
import com.bonggeuda.sugbag.user.dto.UserBlistDTO;
import com.bonggeuda.sugbag.user.dto.UserCouponDTO;
import com.bonggeuda.sugbag.user.dto.UserInfoDTO;
import com.bonggeuda.sugbag.user.dto.UserReservationStatusDTO;
import com.bonggeuda.sugbag.user.dto.UserleaveDTO;


public class UserInfoDAO {
	
	private Properties prop;
	
	public UserInfoDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/userInfo/userInfo-mapper.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}


	public int selectTotalCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int totalCount = 0;
		
		String query = prop.getProperty("selectTotalCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		System.out.println(totalCount);
		return totalCount;
	}
	
	public List<UserInfoDTO> selectUserList(Connection con, PageInfoDTO pageInfo) { // 사용자관리 리스트 select
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<UserInfoDTO> userList = null;
		
		String query = prop.getProperty("selectBoardList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
		
			rset = pstmt.executeQuery();
			
			userList = new ArrayList<>();
			
			while(rset.next()) {
				UserInfoDTO userInfo = new UserInfoDTO();
						
				userInfo.setRnum(rset.getInt("RNUM"));
				userInfo.setName(rset.getString("USER_NICKNAME"));
				userInfo.setEmail(rset.getString("USER_ID"));
				userInfo.setPhoneNumber(rset.getString("USER_PHONE"));
				userInfo.setUserNo(rset.getInt("USER_NO"));
				
				
				userList.add(userInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userList;
	}


	public UserInfoDTO selectDetail(Connection con, String userNo) {  // 사용자 관리  userNo로 select
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectDetail");
		
		UserInfoDTO userInfo = new UserInfoDTO();
		
		
		try {
		
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
//				System.out.println("아이디이이ㅣ이이이이이잉 : " +rset.getString("USER_ID"));		
				userInfo.setEmail(rset.getString("USER_ID"));
				userInfo.setPassword(rset.getString("USER_PWD"));
				userInfo.setName(rset.getString("USER_NICKNAME"));
				userInfo.setPhoneNumber(rset.getString("USER_PHONE"));
				userInfo.setPoint(rset.getInt("POINT"));
				userInfo.setUserNo(rset.getInt("USER_NO"));

			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return userInfo;
	}


	public int insertCoupon (Connection con, UserCouponDTO dto, int hduserNo) { // 사용자 쿠폰 추가 insert

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertCoupon");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setDate(1, dto.getStartDate());
			pstmt.setDate(2, dto.getEndDate());
			pstmt.setInt(3, dto.getCondition());
			pstmt.setInt(4, hduserNo); //히든으로 숨겨서 가져온 회원번호
			pstmt.setString(5, dto.getCouponName());
			pstmt.setInt(6,dto.getDiscount());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
		return result;
	}


	public List<UserleaveDTO> selectLeavelist(Connection con, PageInfoDTO pageInfo) { // 탈퇴회원 list select
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<UserleaveDTO> leaveList = null;
		
		
		String query = prop.getProperty("selectWithdrawList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
		
			rset = pstmt.executeQuery();
			
			leaveList = new ArrayList<>();
			
			while(rset.next()) {
				UserleaveDTO leaveInfo = new UserleaveDTO();
						
				leaveInfo.setRnum(rset.getInt("RNUM"));
				leaveInfo.setEmail(rset.getString("USER_ID"));
				leaveInfo.setReason(rset.getString("WITHDRAW_REASON"));
				leaveInfo.setLeaveDate(rset.getDate("WITHDRAWDATE"));
				leaveInfo.setYear(rset.getDate("YEAR"));
				
				leaveList.add(leaveInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return leaveList;
	}


	public List<UserInfoDTO> searchSearchList(Connection con, PageInfoDTO pageInfo, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		List<UserInfoDTO> userList = null;

		if(condition.equals("userId")) {
			
			query = prop.getProperty("selectSearch");
		} else if(condition.equals("userName")){
			query = prop.getProperty("selectNameSearch");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			pstmt.setString(3, value);

			rset = pstmt.executeQuery();
			
			userList = new ArrayList<>();
			
			while(rset.next()) {
				UserInfoDTO userInfo = new UserInfoDTO();
						
				userInfo.setRnum(rset.getInt("RNUM"));
				userInfo.setName(rset.getString("USER_NICKNAME"));
				userInfo.setEmail(rset.getString("USER_ID"));
				userInfo.setPhoneNumber(rset.getString("USER_PHONE"));
				userInfo.setUserNo(rset.getInt("USER_NO"));
				
				userList.add(userInfo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userList;
	}


	public int searchCount(Connection con, String condition, String value) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		int totalCount = 0;
		
		if(condition.equals("userId")) {
			
			query = prop.getProperty("selectSearchCount");
		} else if(condition.equals("userName")){
			query = prop.getProperty("selectNameCount");
		}
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalCount;

	}


	public List<UserReservationStatusDTO> selectReservationList(Connection con, PageInfoDTO pageInfo) { //사용자 예약현황 list select
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<UserReservationStatusDTO> reservationList = null;
		
		String query = prop.getProperty("selectBookList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
		
			rset = pstmt.executeQuery();
			
			reservationList = new ArrayList<>();
			
			while(rset.next()) {
				
				UserReservationStatusDTO reservationInfo = new UserReservationStatusDTO();
						
				reservationInfo.setBookNo(rset.getInt("BOOK_NO"));
				reservationInfo.setName(rset.getString("BOOK_USER_NAME"));
				reservationInfo.setEmail(rset.getString("USER_ID"));
				reservationInfo.setPrice(rset.getInt("PAYMENT_AMOUNT"));
				reservationInfo.setPeopleCount(rset.getInt("BOOK_PERSONNEL"));
				reservationInfo.setCheckDate(rset.getString("BOOK_CHECK_DATE"));
				reservationInfo.setCheckOutDate(rset.getString("BOOK_CHECKOUT_DATE"));


				reservationList.add(reservationInfo);
				System.out.println("어디있니잉"  + reservationInfo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reservationList;
	}


	public ReservationDetailDTO selectStatusDetail(Connection con, String bookNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReservationDetail");
		
		ReservationDetailDTO reservationDetailInfo = new ReservationDetailDTO();
		
		try {
		
			pstmt = con.prepareStatement(query);
			System.out.println("bookNo :" + bookNo);
			pstmt.setString(1, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
//				System.out.println("아이디이이ㅣ이이이이이잉 : " +rset.getString("USER_ID"));		
				reservationDetailInfo.setEmail(rset.getString("USER_ID"));
				reservationDetailInfo.setName(rset.getString("USER_NICKNAME"));
				reservationDetailInfo.setAccomoName(rset.getString("ACCOMO_NAME"));
				reservationDetailInfo.setRoomName(rset.getString("ROOM_NAME"));
				reservationDetailInfo.setPrice(rset.getInt("PAYMENT_AMOUNT"));				
				reservationDetailInfo.setPeopleCount(rset.getInt("BOOK_PERSONNEL"));
				reservationDetailInfo.setCheckDate(rset.getString("BOOK_CHECK_DATE"));
				reservationDetailInfo.setCheckOutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				reservationDetailInfo.setReservationStatus(rset.getString("BOOK_APPROVE_YN"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reservationDetailInfo;
	}


	public List<UserleaveDTO> searchLeaveList(Connection con, PageInfoDTO pageInfo, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		List<UserleaveDTO> leaveList = null;
		
		if(condition.equals("userId")) {
			
			query = prop.getProperty("selectLeaveList");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			pstmt.setString(3, value);

			rset = pstmt.executeQuery();
			
			leaveList = new ArrayList<>();
			
			while(rset.next()) {
				UserleaveDTO withdrawInfo = new UserleaveDTO();
						
				withdrawInfo.setRnum(rset.getInt("RNUM"));
				withdrawInfo.setEmail(rset.getString("USER_ID"));
				withdrawInfo.setReason(rset.getString("WITHDRAW_REASON"));
				withdrawInfo.setLeaveDate(rset.getDate("WITHDRAWDATE"));
				
				leaveList.add(withdrawInfo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return leaveList;
	}


	public int leaveCount(Connection con, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		int leaveCount = 0;
		
		if(condition.equals("userId")) {
			
			query = prop.getProperty("selectLeaveCount");
		}
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				leaveCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return leaveCount;
	}


	public List<UserReservationStatusDTO> selectSearchIdList(Connection con, PageInfoDTO pageInfo, String condition, String value) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		List<UserReservationStatusDTO> reservationList = null;
		
		if(condition.equals("userId")) {
			
			query = prop.getProperty("selectIdBookList");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			pstmt.setString(3, value);

			rset = pstmt.executeQuery();
			
			reservationList = new ArrayList<>();
			
			while(rset.next()) {
				
				UserReservationStatusDTO reservationInfo = new UserReservationStatusDTO();
				
				reservationInfo.setBookNo(rset.getInt("BOOK_NO"));
				reservationInfo.setName(rset.getString("BOOK_USER_NAME"));
				reservationInfo.setEmail(rset.getString("USER_ID"));
				reservationInfo.setPrice(rset.getInt("PAYMENT_AMOUNT"));
				reservationInfo.setPeopleCount(rset.getInt("BOOK_PERSONNEL"));
				reservationInfo.setCheckDate(rset.getString("BOOK_CHECK_DATE"));
				reservationInfo.setCheckOutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				
				reservationList.add(reservationInfo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reservationList;
	}


	public int bookCount(Connection con, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		int bookCount = 0;
		
		if(condition.equals("userId")) {
			
			query = prop.getProperty("selectBookCount");
		}
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bookCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bookCount;
	}


	public List<UserBlistDTO> selectBlackList(Connection con, PageInfoDTO pageInfo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<UserBlistDTO> blackList = null;
		
		String query = prop.getProperty("selectBlackList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
		
			rset = pstmt.executeQuery();
			
			blackList = new ArrayList<>();
			
			while(rset.next()) {
				
				UserBlistDTO blackInfo = new UserBlistDTO();

						
				blackInfo.setRnum(rset.getInt("RNUM"));
				blackInfo.setReason(rset.getString("BLIST_REASON"));
				blackInfo.setEnrollDate(rset.getDate("ENROLL_DATE"));
				blackInfo.setMemberNo(rset.getInt("MEMBER_NO"));
				blackInfo.setWriterType(rset.getString("WRITER_TYPE"));
				
				blackList.add(blackInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return blackList;
	}


	public int selectblackCount(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		
		int blackCount = 0;
		
		String query = prop.getProperty("selectBlackCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				blackCount = rset.getInt("COUNT(*)");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		

		return blackCount;
	}


	public List<UserBlistDTO> selectBlistMemberNo(Connection con, PageInfoDTO pageInfo, String condition,
			String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		List<UserBlistDTO> blackNoList = null;
		
		if(condition.equals("userNo")) {
			
			query = prop.getProperty("selectBlackListMemberNo");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			pstmt.setString(3, value);

			rset = pstmt.executeQuery();
			
			blackNoList = new ArrayList<>();
			
			while(rset.next()) {
				
				UserBlistDTO blackInfo = new UserBlistDTO();
				
				blackInfo.setRnum(rset.getInt("RNUM"));
				blackInfo.setReason(rset.getString("BLIST_REASON"));
				blackInfo.setEnrollDate(rset.getDate("ENROLL_DATE"));
				blackInfo.setMemberNo(rset.getInt("MEMBER_NO"));
				blackInfo.setWriterType(rset.getString("WRITER_TYPE"));
				
				blackNoList.add(blackInfo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return blackNoList;
	}


	public int blackNoCount(Connection con, String condition, String value) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		int blackNoCount = 0;
		
		if(condition.equals("userNo")) {
			
			query = prop.getProperty("selectBlackNoCount");
		}
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				blackNoCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return blackNoCount;
	}


	public int selectbookCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int bookListCount = 0;
		
		String query = prop.getProperty("selectBookListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				bookListCount = rset.getInt("COUNT(*)");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return bookListCount;
	}


	public List<BestReviewDTO> selectBestReviewList(Connection con, PageInfoDTO pageInfo) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<BestReviewDTO> bestReviewList = null;
		
		String query = prop.getProperty("selectBestReview");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
		
			rset = pstmt.executeQuery();
			
			bestReviewList = new ArrayList<>();
			
			while(rset.next()) {
				BestReviewDTO bestInfo = new BestReviewDTO();
					
				bestInfo.setRnum(rset.getInt("RNUM"));
				bestInfo.setTitle(rset.getString("REVIEW_TITLE"));
				bestInfo.setUserId(rset.getString("USER_ID"));
				bestInfo.setReviewNo(rset.getInt("REVIEW_NO"));
				bestInfo.setAccomoNo(rset.getInt("ACCOMO_NO"));
				
				bestReviewList.add(bestInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bestReviewList;
	}


	public int selectBestReviewCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int bestReviewCount = 0;
		
		String query = prop.getProperty("selectBestReviewCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				bestReviewCount = rset.getInt("COUNT(*)");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
	
		return bestReviewCount;
	}


}



